require 'test_helper'

class ProjectControllerTest < ActionController::TestCase
  test "should get Index" do
    get :Index
    assert_response :success
  end

  test "should get Add" do
    get :Add
    assert_response :success
  end

  test "should get Update" do
    get :Update
    assert_response :success
  end

  test "should get Delete" do
    get :Delete
    assert_response :success
  end

end
