class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :attendees, foreign_key: "attendee_user_id"
  has_many :attendee_events, through: :attendees
  has_many :events, foreign_key: "creator_id", class_name: "Event"
end
