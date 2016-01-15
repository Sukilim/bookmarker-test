class ApplicationController < ActionController::Base
  
  include ApplicationHelper
  protect_from_forgery with: :exception

  private
    def authenticate_user!
      flash[:notice] = "Please login first"
      redirect_to root_path unless user_logged_in?
    end
end
