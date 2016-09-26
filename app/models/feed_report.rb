class FeedReport < ApplicationRecord
  def initialize(params={})
    # params["connectors"] = params["connectors"].map {|connector| Connector.new(connector)}
    super(params)
  end

  def print()
    puts(self)
  end

  # def unmarshal_json(json)
  #   feed_report = FeedReport.new(JSON.parse(json))
  #   return feed_report
  # end
  #
  # def marshal_json(options={})
  #   json = self.as_json(options)
  #   return json
  # end

  # def save()
    # todo IMPLEMENT // save the report to the data base
  # end

  def find(id)
    # todo IMPLEMENT // find the report to the data base with id
  end

  def as_json(options={})
    {
        :id => id,
        :device_id => deviceId,
        :timestamp => timestamp,
        :success => success
    }
  end
end
