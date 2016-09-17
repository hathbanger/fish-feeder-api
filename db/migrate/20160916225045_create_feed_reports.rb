class CreateFeedReports < ActiveRecord::Migration[5.0]
  def change
    create_table :feed_reports do |t|
      t.string :_id
      t.string :device_id
      t.string :timestamp
      t.boolean :success

      t.timestamps
    end
  end
end
