require_relative '../test_helper'

class TaskTest < Minitest::Test
  attr_reader :task

  def setup
    @task = Task.new(   'id'          => 1,
                        'title'       => 'New Task',
                        'description' => 'Task description')
  end

  def test_it_assigns_attributes_correctly
    assert_equal 'New Task', task.title
    assert_equal 'Task description', task.description
    assert_equal 1, task.id
  end
end
