class WelcomeController < ApplicationController
  skip_before_action :authenticate

  def index
    @events = Event.page(params[:page]).per(paginate_per).where('start_at >= ?', Time.now).order(:start_at)
  end
end
