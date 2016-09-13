class FeedReport < ApplicationRecord
  # not sure how to implement a fish id, or fish
  field :Id, type: String
  field :deviceId, type: String
  field :timestamp, type: String
  field :success, type: Boolean

  def print()
    puts(self)
  end

  def unmarshall_json(json)
    feed_report = FeedReport.new(JSON.parse(json))
    return feed_report
  end

  def marshall_json(options={})
    json = self.as_json(options)
    return json
  end

  def save()
    # todo IMPLEMENT // save the report to the data base
  end

  def find(id)
    # todo IMPLEMENT // find the report to the data base with id
  end
end





