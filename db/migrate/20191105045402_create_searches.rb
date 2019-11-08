class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :text
      t.references :user, :user_id :null=>true, foreign_key:true
      t.timestamps
    end
  end
end
