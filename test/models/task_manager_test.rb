require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_task
    create_tasks(1)
    task = task_manager.find(1)
    assert_equal 'Title1', task.title
    assert_equal 'Learn 1 tests!', task.description
    assert_equal 1, task.id
  end

  def test_it_returns_all_tasks
    create_tasks(2)
    tasks = task_manager.all
    assert_equal 2, tasks.length
  end

  def test_it_can_find_a_task
    create_tasks(1)
    task = task_manager.find(1)
    assert_equal 'Title1', task.title
    assert_equal 'Learn 1 tests!', task.description
    assert_equal 1, task.id
  end

  def test_it_can_update_a_task
    create_tasks(2)
    task_manager.update(2, title: 'Update', description: 'Test the update')
    task = task_manager.find(2)
    assert_equal 2, task.id
    assert_equal 'Update', task.title
    assert_equal 'Test the update', task.description
  end

  def test_it_can_destroy_task
    create_tasks(2)
    assert_equal 2, task_manager.all.length
    task_manager.destroy(1)
    tasks = task_manager.all
    assert_equal 1, tasks.length
  end
end
