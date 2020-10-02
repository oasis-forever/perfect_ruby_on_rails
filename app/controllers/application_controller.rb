class ApplicationController < ActionController::Base
  helper_method :logged_in?

  private

  def logged_in?
    # Return false in case of false and nil
    # Otherwise, return true
    !!session[:user_id]
  end
end
