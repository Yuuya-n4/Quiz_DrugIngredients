class AdminUser < ApplicationRecord
  devise :database_authenticatable

  validates :email, presence: true, uniqueness: true
end
