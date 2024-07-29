class Post < ApplicationRecord
  acts_as_paranoid

  belongs_to :user

  validates :title, presence: { message: "Title can't be left blank" }
  validates :body, presence: { message: "Body is required" }
  validates :user_id, presence: { message: "User must be associated" }
end
