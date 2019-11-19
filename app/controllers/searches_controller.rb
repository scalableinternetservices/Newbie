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
    @search = Search.find(params[:id])
    # GET similar URLS FOR THIS SEARCH
    results = get_results(@search.text)
    @urls = results["urls"]
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
    @user = User.find(1) if User.count > 0
    if current_user.nil?
      @search = Search.create(search_params)
      #all the public search without signing in will be marked with user_id equals to 1
      if @user.nil?
        @user = User.new(user_name:"admin",email:"admin@newbie.com",encrypted_password:"012340", password:"012340")
        @user.id = 1
        @user.save!
      end
      @search = @user.searches.create(search_params)
      #@search.user_id = 0
    else
      @user = current_user
      @search = @user.searches.create(search_params)
      p @search
    end

    # GET SCORE FOR THIS SEARCH
    results = get_results(@search.text)
    @search.score = results["score"]
    @urls = results["urls"]
    # results["matching_ids"]

    #for testing, default score value 66
    #@search.score = 100 if @search.score.nil?

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

    def get_results(search_text)
      results = {}
      matching_articles = Article.search(search_text).with_pg_search_rank
      total_score = 0

      counter = 0
      matching_ids = []
      matching_urls = []
      for article in matching_articles do
        next if article.pg_search_rank < 0.4
        publication_score = get_publication_score(article.url)
        total_score += article.pg_search_rank * publication_score
        counter += 1
        matching_ids.append(article.id)
        matching_urls.append(article.url)
      end
      puts(matching_ids)

      saver = 0
      saver = total_score / counter if counter != 0
      results["score"] = saver * 100
      results["matching_ids"] = matching_ids
      results["urls"] = matching_urls
      results
    end

    def get_publication_name(url)
      if url.nil?
        puts("URL NOT PARSABLE")
        return "unknown"
      end
      url.split('www.')[1].split('.')[0]
    end

    def get_publication_score(url)
      publication_name = get_publication_name(url)
      publication_score_mapping = get_publication_score_mapping()
      return 0.5 if !publication_score_mapping.has_key?(publication_name.to_sym)
      return publication_score_mapping[publication_name.to_sym]
    end

    def get_publication_score_mapping()
      {
        "wsj": 0.81,
        "nytimes": 0.78,
        "bloomberg": 0.8,
        "bbc": 0.9,
        "washingtonpost": 0.6,
        "usatoday": 0.2,
        "time": 0.7,
        "thesun": 0.1,
        "thepostgame": 0.13,
        "theguardian": 0.81,
        "telegraph": 0.68,
        "sfgate": 0.48,
        "reuters": 0.74,
        "people": 0.31,
        "nypost": 0.48,
        "nbc": 0.71,
        "nbcnews": 0.71,
        "msnbc": 0.71,
        "mashable": 0.1,
        "latimes": 0.69,
        "forbes": 0.83,
        "cnn": 0.68,
        "cnbc": 0.71,
        "buzzfeed": 0.11,
        "aljazeera": 0.75,
        "chicagotribune": 0.67
      }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:text)
    end
end
