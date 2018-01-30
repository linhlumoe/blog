class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :content, presence: true, length: { minimum: 10, maximum: 1000 }
  default_scope -> { order(created_at: :desc) }
  scope :published_status, -> { where(status: 1) }
  scope :starts_with, -> (title) { where("title ilike ?", "%#{title}%") }
  after_initialize :set_default, if: :new_record?

  def set_default
    self.status ||= 0
  end
end
