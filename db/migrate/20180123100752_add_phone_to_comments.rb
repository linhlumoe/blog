class AddPhoneToComments < ActiveRecord::Migration
  def change
    add_column :comments, :phone, :string
  end
end
