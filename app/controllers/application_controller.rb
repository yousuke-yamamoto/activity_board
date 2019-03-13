class ApplicationController < ActionController::Base
    before_action :basic_auth
    protect_from_forgery with: :exception
    
    private
    def basic_auth
        authenticate_or_request_with_http_basic do |name, password|
            name == ENV['BASIC_AUTH_NAME'] && password == ENV['BASIC_AUTH_PASSWORD']
        end
    end
end
