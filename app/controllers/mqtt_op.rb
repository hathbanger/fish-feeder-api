require 'mqtt'


class MqttOp
  def initialize
    puts "NEW MQTT CLIENT!"
    @client = MQTT::Client.connect('test.mosquitto.org')
    Thread.new{ self.mqtt_listen }
  end

  def mqtt_listen
    puts "LISNENER ON"
    @client.get('test') do |topic,message|
      puts "#{topic}: #{message}"
    end
  end

  def feed_fish
    @client.publish('test', 'feed_fish')
  end
end