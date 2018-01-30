class RemoveDateFromTimeline < ActiveRecord::Migration
  def change
    remove_column :timelines, :date
  end
end
