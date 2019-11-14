class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.date :date_published
      t.text :title
      t.text :body
      t.text :summary
      t.string :url

      t.timestamps
    end
  end
end
