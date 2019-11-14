class Article < ApplicationRecord
  include PgSearch

  pg_search_scope(
    :search,
    against: %i(
      title
      body
    ),
    using: {
      tsearch: {
        tsvector_column: "tsv",
        prefix: true,
        dictionary: "english",
      }
    }
  )
end
