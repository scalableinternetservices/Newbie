class AddScoreToSearches < ActiveRecord::Migration[6.0]
  def change
    add_column :searches, :score, :int
  end
end
