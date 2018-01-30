class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  enum role: [:visitor, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :visitor
  end
  mount_uploader :avatar, AvatarUploader
end
