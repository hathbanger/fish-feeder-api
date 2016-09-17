require 'mqtt'
require 'json'

class MqttOp
  def initialize
    puts "NEW MQTT CLIENT!"
    @client = MQTT::Client.connect(
        :host => 'test.mosquitto.org',
        :port => 1883
    )
    Thread.new{ self.mqtt_listen }
  end

  def mqtt_listen
    puts "LISNENER ON"
    @client.get('to_web') do |topic, message|
      # puts "#{topic}: #{message}"
      self.handle_message(message)
    end
  end

  def feed_fish(tank_id)
    @client.publish('to_device', 'feed_fish', tank_id)
  end

  def handle_message(message)
    messages = message.split(" ")
    deviceId = messages[0]
    code = messages[1]
    status = messages[2]
    message = messages[3]
    if code == "status"
      if status == "Task_Completed"
        puts ("Status: " + status + "Task: " + message)
        # todo Implement
      end
      if status == "Task_Recieved"
        # todo Implement
      end
    elsif code == "report"
      if status == "pass"
        puts message
        # haash = JSON.parse(message)
        # puts haash
        # feed_report = FeedReport.new
        #
        # feed_report.id = haash["id".to_sym]
        # feed_report.deviceIdId = haash["device_id"]
        # feed_report.timestamp = haash["timestamp"]
        # feed_report.success = haash["success"]

        # feed_report = FeedReport.new(ActiveSupport::JSON.decode(message))

        feed_report = FeedReport.new(message)
        puts feed_report._id
        feed_report.save
      end
    end
  end
end