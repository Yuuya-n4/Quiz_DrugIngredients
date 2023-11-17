require "test_helper"

class QuizSetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quiz_sets_index_url
    assert_response :success
  end
end
