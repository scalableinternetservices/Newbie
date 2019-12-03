class Search < ApplicationRecord
  after_save    :expire_search_all_cache
  after_destroy :expire_search_all_cache

  belongs_to :user, optional: true
  validates :text, presence: true
  validates :score, presence:true, numericality: { :less_than_or_equal_to => 100, :greater_than_or_equal_to => 0}

  def self.all_cached
    Rails.cache.fetch('Search.all') { all.to_a }
  end

  def expire_search_all_cache
    Rails.cache.delete('Search.all')
  end
end
