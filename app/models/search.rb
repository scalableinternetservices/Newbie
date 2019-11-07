class Search < ApplicationRecord
  belongs_to :user, optional: true
  validates :text, presence: true
  validates :score, presence:true, numericality: { :less_than_or_equal_to => 100, :greater_than_or_equal_to => 0}
end
