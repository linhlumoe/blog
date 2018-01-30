class AddDateToTimeline < ActiveRecord::Migration
  def change
    add_column :timelines, :date, :datetime
  end
end
