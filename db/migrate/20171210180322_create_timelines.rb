class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.date :date
      t.string :name_of_date
      t.text :description
      t.string :picture
      t.timestamps null: false
    end
  end
end
