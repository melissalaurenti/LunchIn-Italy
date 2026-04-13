class Connection < ApplicationRecord
  belongs_to :user
  belongs_to :connected_user, class_name: "User"
  belongs_to :event, optional: true

  validates :status, presence: true

  enum :status, {
    pending: "pending",
    accepted: "accepted",
    declined: "declined"
  }
end
