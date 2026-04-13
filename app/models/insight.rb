class Insight < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :kind, :content, presence: true
end
