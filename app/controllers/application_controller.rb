require 'mqtt_op'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :set_cors

  # Needs to be instantiated to a super class somewhere so multiple other controllers can use the same client
  $mqtt = MqttOp.new
  
  def set_cors
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = 'http://localhost:8080'
  end
end
