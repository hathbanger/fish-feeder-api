# Load the Rails application.
require_relative 'application'
require_relative '../app/controllers/mqtt_op'

# Initialize the Rails application.


$mqtt = MqttOp.new
Rails.application.initialize!
