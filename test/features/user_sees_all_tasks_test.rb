require_relative '../test_helper'
# UserSeesAllTasksTest
class UserSeesAllTasksTest < FeatureTest
  def test_user_sees_all_tasks
    task_manager.create(title: 'Title1', description: 'description1')
    task_manager.create(title: 'Title2', description: 'description2')

    visit '/tasks'
    assert page.has_content?('1: Title1')
    assert page.has_content?('2: Title2')
  end
end
