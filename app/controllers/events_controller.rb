class EventsController < ApplicationController
 respond_to :json

 def create
  @event = Event.new(event_params)
  if @event.save
    render json: @event
  else
    render json: @event.errors.full_messages
  end

  private

  def event_params
    params.require(:event).permit(:site_id)
end