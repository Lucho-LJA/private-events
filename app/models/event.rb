class Event < ApplicationRecord
    has_many :attendees, foreign_key: :attendee_event_id
    has_many :attendees_users, through: :attendees, source: :attendee_user
    belongs_to :creator, class_name: "User"
end
