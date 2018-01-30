class Comment < ActiveRecord::Base
  belongs_to :article
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :commenter, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :phone, presence: true, length: { minimum: 10, maximum: 15 }
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :text, presence: true, length: { minimum: 2, maximum: 255 }

  default_scope -> { order(created_at: :desc) }
end
