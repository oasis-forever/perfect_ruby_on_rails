class TicketsController < ApplicationController
  def new
    raise ApplicationController::RoutingError, 'ログイン状態で TicketsController#new にアクセスされました'
  end

  def create
    event = Event.find(params[:event_id])
    @ticket = current_user.tickets.build do |t|
      t.event = event
      t.comment = params[:ticket][:comment]
    end
    return unless @ticket.save!
    redirect_to event, notice: 'このイベントに参加表明しました'
  end

  def destroy
    ticket = current_user.tickets.find_by!(event_id: params[:event_id])
    ticket.destroy!
    redirect_to event_path(params[:event_id]), notice: 'このイベントの参加をキャンセルしました'
  end
end
