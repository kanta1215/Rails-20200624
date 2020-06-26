class ApplicationController < ActionController::Base
  include ApplicationHelper
=begin  USERS = { "admin_user" => "admin_password"}
  before_action :authenticate

  private
    def authenticate
      authenticate_or_request_with_http_digest do |username|
        USERS[username]
      end
=end    end
  before_action :login

  private
    def login
      unless session[:user_id]
        redirect_to new_auth_path
      end
    end

    def admin
      if !current_user.admin
        redirect_to root_path
      end
    end
end
