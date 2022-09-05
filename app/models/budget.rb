class Budget < ApplicationRecord
  belongs_to :user
  has_many :categories

  validates :name, presence: true
  validates :user_id, presence: true
end
