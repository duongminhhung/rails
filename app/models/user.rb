class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_paranoid
  has_many :posts, dependent: :destroy

  validates :name, presence:true
  validates :email, presence:true
  belongs_to :group
  has_many :user_permissions
  has_many :permissions, through: :user_permissions

  def self.admin_role
    User.instance_eval { @admin_context = true }
    yield
  ensure
    User.instance_eval { @admin_context = nil }
  end
end
