class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :operations
  has_many :groups

  validates :name, presence: true, length: { maximum: 100 }
end
