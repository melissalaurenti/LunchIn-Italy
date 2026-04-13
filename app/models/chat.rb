class Chat < ApplicationRecord
  belongs_to :event, optional: true

  has_many :chat_memberships, dependent: :destroy
  has_many :users, through: :chat_memberships
  has_many :messages, dependent: :destroy

  validates :chat_type, presence: true

  enum :chat_type, {
    event: "event",
    direct: "direct",
    group: "group"
  }
end
