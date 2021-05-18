class EventsController < ApplicationController
  
  def index
    @event = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new 
  end

  def create
  @event = Event.create(event_params)
  redirect_to root_path(event.id)
  end

  private 
  def event_params
    params.require(:event).permit(:title, :description, :duration, :price, :location, :start_date) 
  end

end
