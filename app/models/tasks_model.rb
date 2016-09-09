class Tasks < ApplicationRecord
  def initialize
    @tasks = {}
    self.add_task("feed", 100)
  end

  def add_task(task, status_code)
    @tasks.store(task, status_code)
  end
end

