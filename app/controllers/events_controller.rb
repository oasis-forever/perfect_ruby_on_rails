class EventsController < ApplicationController
  skip_before_action only: :show
  before_action :set_event, only: [:show]
  before_action :set_event_of_current_user, only: [:edit, :update]

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: 'イベントを登録しました'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'イベントを更新しました'
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :content, :start_at, :end_at)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_event_of_current_user
    @event = current_user.created_events.find(params[:id])
  end
end
