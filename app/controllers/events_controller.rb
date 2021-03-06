class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /events or /events.json
  def index
    @events = Event.all.order("created_at DESC")
    @events_past = @events.where(event_date: Time.at(0)...Time.now.in_time_zone)
    @events_future = @events.where(event_date: Time.now.in_time_zone...DateTime::Infinity.new)
    @event = Event.new
  end

  # GET /events/1 or /events/1.json
  def show
    @users = []
    Attendee.all.where(attendee_event_id: @event.id).find_each do |guest|
      @users.append(guest.attendee_user)
    end
  end

  # GET /events/new
  def new
    @event = current_user.events.build
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = current_user.events.build(event_params)
    

    respond_to do |format|
      if @event.save
        @attendee = current_user.attendees.build(attendee_event_id: @event.id)
        if   @attendee.save
          format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to index, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy

    @event.destroy
    p "okokoko"
    
    respond_to do |format|
      format.html { redirect_to root_path, status: 303,
      notice: "Event was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :event_date, :description)
    end
end
