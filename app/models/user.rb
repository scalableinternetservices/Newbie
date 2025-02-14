class User < ApplicationRecord
  after_save    :expire_user_all_cache
  after_destroy :expire_user_all_cache

  has_many :searches

  has_many :active_relationships,
  			class_name: "Relationship",
  			foreign_key: "follower_id",
  			dependent: :destroy
  has_many :passive_relationships,
  			class_name: "Relationship",
  			foreign_key: "followed_id",
  			dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  # Follows a user.
  def follow(other_user)
	following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
  	following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
  	following.include?(other_user)
  end

  # caching
  def self.all_cached
    Rails.cache.fetch('User.all') { all.to_a }
  end

  #user search history caching
  #def self.searches_cached
  #  Rails.cache.fetch('User.searches') { User.find(params[:id]).searches.to_a }
  #end

  # expire cache
  def expire_user_all_cache
    Rails.cache.delete('User.all')
  end
end
