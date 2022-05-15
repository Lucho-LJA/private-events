class AttendeesController < ApplicationController
    def create
        @attendee = current_user.attendees.build(attendee_event_id:params[:send_object])
        respond_to do |format|
            if @attendee.save
              format.html { redirect_to attendee_url(@attendee), notice: "Event was successfully created." }
            else
              format.html { render "events/index", status: :unprocessable_entity }
            end
        end

    end

end
