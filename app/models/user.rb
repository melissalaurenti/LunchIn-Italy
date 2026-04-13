class User < ApplicationRecord
  belongs_to :city
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances
  has_many :user_interests, dependent: :destroy
  has_many :interests, through: :user_interests
  has_many :chat_memberships, dependent: :destroy
  has_many :chats, through: :chat_memberships
  has_many :messages, dependent: :destroy

  has_many :sent_connections,
           class_name: "Connection",
           foreign_key: :user_id,
           dependent: :destroy

  has_many :received_connections,
           class_name: "Connection",
           foreign_key: :connected_user_id,
           dependent: :destroy

  has_many :insights, dependent: :destroy

  validates :first_name, :last_name, :city, presence: true

  enum :role, {
    user: "user",
    admin: "admin"
  }
end
