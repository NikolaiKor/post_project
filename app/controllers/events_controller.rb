# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  address    :string
#  started_at :datetime
#  image      :string           default("no_image.png")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_ids    :integer          default([]), is an Array
#
# Indexes
#
#  index_events_on_id       (id)
#  index_events_on_tag_ids  (tag_ids)
#

class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page])

    respond_to do |format|
      format.html do
        _max_time=0
        @events.each do |event|
          _time = event.updated_at.to_i
          _max_time = _time if _max_time < _time
        end
        fresh_when last_modified:Time.at(_max_time), etag: @events
      end
      format.json { render json: @events }
    end
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    fresh_when last_modified: @event.updated_at.utc, etag: @event
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
