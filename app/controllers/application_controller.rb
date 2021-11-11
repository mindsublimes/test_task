class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  def authenticate_user!
    render sign_in_users_path if session[:user].nil?
  end
end
