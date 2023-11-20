class User < ApplicationRecord
  has_many :scores, dependent: :destroy
  has_one :avatar, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :scores, dependent: :destroy
  has_one :avatar, dependent: :destroy

  validates :name, :email, presence: true
end
