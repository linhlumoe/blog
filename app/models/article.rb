class article < ActiveRecord::Base
  # belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :content, presence: true, length: { minimum: 10, maximum: 1000 }
  default_scope -> { order(created_at: :desc) }
end
