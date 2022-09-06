class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups
  has_many :operations

  validates :name, presence: true, length: { in: 1..100 }
end
