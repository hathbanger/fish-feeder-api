require 'mqtt'

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
      puts "#{topic}: #{message}"
      self.handle_message(message)
    end
  end

  def feed_fish
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
      if status == "feed_report"
        feed_report = FeedReport.new
        feed_report = feed_report.unmarshall_json(message)
        feed_report.print
      end
    end
  end
end

