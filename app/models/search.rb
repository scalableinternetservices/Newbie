class Search < ApplicationRecord
  validates :text, presence: true
  validates :score, presence:false, numericality: { :less_than_or_equal_to => 100, :greater_than_or_equal_to => 0}
end
