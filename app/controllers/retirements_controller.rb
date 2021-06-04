class RetirementsController < ApplicationController
  def new
  end

  def create
    return unless current_user.destroy
    reset_session
    redirect_to root_path, notice: '退会が完了しました'
  end
end
