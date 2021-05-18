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
    p "$"*60
    p params
    @event = Event.new(title:params[:title],description:params[:description],admin_id:current_user.id,duration:params[:duration],location:params[:location],price:params[:price],start_date:params[:start_date].to_datetime)
    p @event
    if @event.save
      redirect_to root_path, notice: "L'évènement '#{@event.title.capitalize}' a bien été créé ! Félicitation"
    else
      flash.now[:messages] = @event.errors.full_messages
      render new_event_path
    end
  end

  private 
  def event_params
    params.require(:event).permit(:title, :description, :duration, :price, :location, :start_date) 
  end

end
