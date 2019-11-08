class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :text
      t.references :user, null:true, foreign_key:true
      t.timestamps
    end
    
    change_column_null :user_id, true
  end
end
