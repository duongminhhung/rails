class User < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
