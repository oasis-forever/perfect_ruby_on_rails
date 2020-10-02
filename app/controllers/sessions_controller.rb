class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash!(request.env['omniauth.auth'])
    session['user_id'] = user.id
    redirect_to root_path, notice: 'You\'ve successfully logged in!'
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'You\'ve successfully logged out!'
  end
end
