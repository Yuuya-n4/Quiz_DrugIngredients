class User < ApplicationRecord
  has_many :scores, dependent: :destroy
  has_one :avatar, dependent: :destroy

  validates :name, :email, presence: true
end
