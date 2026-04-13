class City < ApplicationRecord
  has_many :users, dependent: :restrict_with_exception
  has_many :events, dependent: :restrict_with_exception

  validates :name, :country_code, presence: true
  validates :name, :uniqueness: true
end
