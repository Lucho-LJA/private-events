class AttendeesController < ApplicationController
    def create
        if current_user
            @attendee = current_user.attendees.build(attendee_event_id:params[:send_object])
            respond_to do |format|
                if @attendee.save
                format.html { redirect_to event_url(Event.find(params[:send_object])), 
                    notice: "Event was successfully created." }
                else
                format.html { render "events/index", status: :unprocessable_entity }
                end
            end    
        else
            redirect_to new_user_session_url
        end
    end

    def destroy
        @attendee = current_user.attendees.where(attendee_event_id:params[:send_object])
        @attendee.destroy_all
        respond_to do |format|
          format.html { redirect_to events_url(Event.find(params[:send_object])), 
            notice: "Event was successfully destroyed." }
        end
    end

end
