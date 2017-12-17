class Comment < ActiveRecord::Base
  belongs_to :article
  validates :commenter, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :text, presence: true
end
