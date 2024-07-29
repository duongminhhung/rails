class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_paranoid
  has_many :posts, dependent: :destroy

  validates :name, presence: { message: "Name can't be left blank" }, if: -> { @admin_context.nil? || !@admin_context }
  validates :email, presence: { message: "Email is required" }, uniqueness: { message: "Email must be unique" }

  def self.admin_role
    User.instance_eval { @admin_context = true }
    yield
  ensure
    User.instance_eval { @admin_context = nil }
  end
end
