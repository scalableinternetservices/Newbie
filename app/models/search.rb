class Search < ApplicationRecord
  #after_save    :expire_search_all_cache
  #after_destroy :expire_search_all_cache

  belongs_to :user, optional: true
  validates :text, presence: true
  validates :score, presence:true, numericality: { :less_than_or_equal_to => 100, :greater_than_or_equal_to => 0}


#for front page display
  def self.all_cached

    #only cache the top five searches
    Rails.cache.fetch('Search.all') { all.sort_by {|obj| -obj.score}[0..4].to_a }
    #Rails.cache.fetch('Search.all') { all.to_a }
  end

  def expire_search_all_cache
    Rails.cache.delete('Search.all')
  end
end
