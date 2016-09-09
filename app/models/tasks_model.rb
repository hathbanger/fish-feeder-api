class Tasks < ApplicationRecord
  $status_codes = Hash.new("Status Codes")
  $status_codes[100] = "idle"
  $status_codes[101] = "feeding"

  def initialize
    @tasks = {}
    self.add_task("feed", 100)
  end

  def add_task(task, status_code)
    @tasks.store(task, status_code)
  end
end

