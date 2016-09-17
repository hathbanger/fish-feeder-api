require 'mqtt_op'

class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # after_action :set_cors
  attr_reader :current_user
  
  # Needs to be instantiated to a super class somewhere so multiple other controllers can use the same client
  $mqtt = MqttOp.new
  
  # def set_cors
  #   headers['Access-Control-Allow-Origin'] = '*'
  #   headers['Access-Control-Request-Method'] = 'http://localhost:8080'
  # end

 protected
  def authenticate_request!
    unless user_id_in_token?
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      return
    end
    @current_user = User.find(auth_token[:user_id])
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  private
  def http_token
      @http_token ||= if request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ').last
      end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end


end
