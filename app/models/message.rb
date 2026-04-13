class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :body, presence: true, unless: -> { attachment_url.present? }

  enum :message_type, {
    text: "text",
    image: "image",
    file: "file",
    system: "system"
  }
end
