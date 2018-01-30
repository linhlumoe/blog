class Timeline < ActiveRecord::Base
  validates :date, presence: true
  validates :name_of_date, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 200 }

  mount_uploader :picture, PictureUploader

  default_scope -> { order(date: :asc) }
end
