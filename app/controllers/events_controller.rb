class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create
    @events = Event.new(event_params)
    @events.save
    if !@events.save
      flash[:errors] = @events.errors.full_messages
      redirect_to "/events"
    else
      redirect_to "/events/#{@events.id}"
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to "/event/#{@event.id}"
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to "/events/#{@event.id}/edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.user == current_user
      @event.destroy
      redirect_to "/events"
    else
      redirect_to "/events"
    end
  end

  private
    def event_params
      params.require(:event).permit(:name, :city, :state, :date, :user_id)
    end
end
