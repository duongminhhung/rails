class Post < ApplicationRecord
  acts_as_paranoid

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true
end
