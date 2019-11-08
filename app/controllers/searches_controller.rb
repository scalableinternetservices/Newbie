class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  #these actions wont need login
  #skip_before_action :require_login, only: [:new, :create, :index]

  # GET /searches
  # GET /searches.json
  def index
    @user = current_user
    @searches = Search.all
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
    @user = current_user
  end

  # GET /searches/new
  def new
    @search = Search.new
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  # POST /searches.json
  def create

    #check if user signs in or not
    @search = nil
    @user = nil
    if current_user.nil?
      @search = Search.create(search_params)
     #all the public search without signing in will be marked with user_id equlas to 1
      #@user = User.new(user_name:"admin",emial:"admin@newbie.com") 
      #@search.user_id = 0
    else
      @user = current_user
      @search = @user.searches.create(search_params)
      p @search
    end

    #for testing, default score value 66
    @search.score = 100 if @search.score.nil?


    respond_to do |format|
      if @search.save
        #format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.html { redirect_to "/searches/#{@search.id}", notice: 'Search was successfully created.' }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url, notice: 'Search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section."
        redirect_to new_login_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:text)
    end
end
