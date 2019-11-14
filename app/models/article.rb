class Article < ApplicationRecord
  include PgSearch

  pg_search_scope :search_for, against: :body, using: { tsearch: { any_word: true } }
end
