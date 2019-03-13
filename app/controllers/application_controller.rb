class ApplicationController < ActionController::Base
    before_action :basic_auth
    protect_from_forgery with: :exception
    
    private
    
    def basic_auth
        http_basic_authenticate_with :name => ENV['BASIC_AUTH_USERNAME'], :password => ENV['BASIC_AUTH_PASSWORD'] if Rails.env == "production"
    end
end
