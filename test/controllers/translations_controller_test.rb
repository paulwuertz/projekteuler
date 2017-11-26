require 'test_helper'

class TranslationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @update = {
        title: 'New title',
        content: 'This is the new content',
    }
    @incorrect = {
        title: '',
        content: ''
    }
  end

  test "should get new for translated problem" do
    get new_problem_translation_url(problem_id: 1)
    assert_response :success
  end

  test "should get new for untranslated problem" do
    get new_problem_translation_url(problem_id: 3)
    assert_response :success
  end

  test "should create translation" do
    assert_difference('Translation.count') do
      post problem_translations_url(problem_id: 1, translation: @update)
    end

    assert_redirected_to problem_path(id: 1)
  end

  test "should not create incorrect translation" do
    assert_no_difference('Translation.count') do
      post problem_translations_url(problem_id: 1, translation: @incorrect)
    end
  end
end
