class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :keywords
      t.string :url

      t.timestamps
    end

    add_index :articles, :title
    add_index :articles, :keywords
    add_index :articles, :url
  end
end
