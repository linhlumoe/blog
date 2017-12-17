class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :content
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
