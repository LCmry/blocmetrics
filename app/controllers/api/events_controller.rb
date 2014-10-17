class Api::EventsController < Api::BaseController
 respond_to :json

 def index
  render json: {message: "ok"}
 end

  def create
    @event = Event.new(event_params)
    if @event.save
      render json: @event
    else
      render json: @event.errors.full_messages
    end
  end

  private

  def event_params
    params.require(:event).permit(:site_id)
  end
end