class Post < ApplicationRecord
  acts_as_paranoid

  belongs_to :user

  validates :title, presence: { message: "can't be left blank" }
  validates :body, presence: { message: "is required" }
  validates :user_id, presence: { message: "must be associated" }
end
