class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @events }
    end
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to @event
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:image, :title, :address, :started_at)
  end
end
