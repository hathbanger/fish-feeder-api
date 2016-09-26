require 'mqtt'
require 'json'

class MqttOp
  def initialize
    puts "NEW MQTT CLIENT!"
    begin
      @client = MQTT::Client.connect(
          :host => '138.68.47.232',
          :port => 8883,
          :username => "mosquitto",
          :password => "amh05055"
      )
      Thread.new{ self.mqtt_listen }
    rescue
      puts "broke! "
    end
  end

  def mqtt_listen
    puts "LISNENER ON"
    @client.get('to_web') do |topic, message|
      # puts "#{topic}: #{message}"
      self.handle_message(message)
    end
  end

  def feed_fish
    puts "feed fish fired!"
    @client.publish('to_device', 'feed_fish')
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

        # feed_report.id = haash["id"]
        # feed_report.deviceIdId = haash["device_id"]
        # feed_report.timestamp = haash["timestamp"]
        # feed_report.success = haash["success"]

        # feed_report = FeedReport.new(ActiveSupport::JSON.decode(message))

        # feed_report = FeedReport.new(JSON.parse(message))
        # feed_report = feed_report.unmarshal_json(message)
        # puts feed_report.id
      end
    end
  end
end