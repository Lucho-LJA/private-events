class CreateAttendee < ActiveRecord::Migration[7.0]
  def change
    create_table :attendees do |t|
      t.integer :attendee_user_id
      t.integer :attendee_event_id
      t.timestamps
    end
  end
end
