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
    @client.get('to_web') do |topic,message|
      puts "#{topic}: #{message}"
    end
  end

  def feed_fish
    @client.publish('to_device', 'feed_fish')
  end
end