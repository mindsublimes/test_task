class User < ApplicationRecord
  validates :email, :password, :confirm_password, presence: true
  validates :email, uniqueness: true
end
