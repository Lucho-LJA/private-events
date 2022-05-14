class Attendee < ApplicationRecord
    belongs_to :attendee_user, class_name: "User"
    belongs_to :attendee_event, class_name: "Event"
end
