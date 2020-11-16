class EventsController < ApplicationController
  skip_before_action :authenticate, only: :show
  before_action :set_event, only: :show
  before_action :set_event_of_current_user, only: %i(edit update destroy)

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
    @ticket = current_user && current_user.tickets.find_by(event: @event)
    @tickets = @event.tickets.includes(:user).order(:created_at)
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'イベントを更新しました'
    end
  end

  def destroy
    @event.destroy!
    redirect_to root_path, notice: 'イベントを削除しました'
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
