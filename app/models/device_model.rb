class Device < ApplicationRecord
  field :Id, type: String
  field :FeedReportsIds, type: String

  def print()
    puts(self)
  end

  def unmarshall_json(json)
    device = Device.new(JSON.parse(json))
    return device
  end

  def marshall_json(options={})
    json = self.as_json(options)
    return json
  end

  def save()
    # todo IMPLEMENT // save the device to the data base
  end

  def find(id)
    # todo IMPLEMENT // find the device the data base with id
  end

  def get_feed_reports
    feed_reports = nil
    # todo IMPLEMENT // find all the Feed Reports that are in the FeedReportsIds
    return feed_reports
  end

  def get_feed_report(id)
    feed_reports = nil
    # todo IMPLEMENT // find the Feed Report with param id
    return feed_reports
  end
end