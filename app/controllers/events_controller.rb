class EventsController < ApplicationController
  skip_before_action only: :show
  before_action :set_event, only: [:show]

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: 'イベントが登録されました'
    end
  end

  def show
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :content, :start_at, :end_at)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
