class Event < ApplicationRecord
  belongs_to :city
  belongs_to :host, class_name: "User"

  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances
  has_many :event_interests, dependent: :destroy
  has_many :interests, through: :event_interests

  has_one :chat, dependent: :destroy

  has_many :connections, dependent: :nullify
  has_many :insights, dependent: :destroy

  validates :title, :city, :host, :capacity, :starts_at, :ends_at, presence: true
  validates :capacity, numericality: { greater_than: 0 }

  enum :status, {
    draft: "draft",
    published: "published",
    cancelled: "cancelled",
    completed: "completed"
  }

  enum :visibility, {
    visible_public: "public",
    visible_private: "private"
  }
end
