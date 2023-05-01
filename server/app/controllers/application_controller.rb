class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

  before_action :set_cors_headers
  
    def set_cors_headers
      headers['Access-Control-Allow-Origin'] = 'http://localhost:3000'
      headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, X-CSRF-Token'
      headers['Access-Control-Allow-Credentials'] = 'true'
    end

    def get_csrf_token
        render json: { csrf_token: form_authenticity_token }
      end
  end
  