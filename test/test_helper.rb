ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/emoji'
require 'tilt/erb'

module TestHelpers
  def teardown
    task_manager.delete_all
    super
  end

  def create_tasks(num)
    num.times do |i|
      task_manager.create(title: "Title#{i+1}", description: "Learn #{i+1} tests!")
    end
  end

  def task_manager
    database = YAML::Store.new('db/task_manager_test')
    @task_manager ||= TaskManager.new(database)
  end
end
