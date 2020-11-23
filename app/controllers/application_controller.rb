class ApplicationController < ActionController::Base
  before_action :authenticate
  helper_method :logged_in?, :current_user

  private

  def logged_in?
    # Return false in case of false and nil
    # Otherwise, return true
    !!current_user
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: 'ログインしてください'
  end

  def paginate_per
    session[:paginate_per] = params[:per] if params[:per].present?
    session[:paginate_per]
  end

  def keep_last_pagination_data
    session[:last_pagination_data] = {
      params: request.query_parameters,
      controller: controller_name,
      action: action_name
    }
  end

  def load_pagination_params(action)
    data = session[:last_pagination_data].presence
    if data["controller"] == controller_name && data["action"] == action.to_s
      session[:last_pagination_data] = nil
      ret = data["params"]
    end
  end

  def redirect_with_kept_pagination_params(action:, **args)
    redirect_to({ action: action, params: load_pagination_params(action) }, args)
  end
end
