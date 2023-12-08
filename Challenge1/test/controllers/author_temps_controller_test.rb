require "test_helper"

class AuthorTempsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author_temp = author_temps(:one)
  end

  test "should get index" do
    get author_temps_url
    assert_response :success
  end

  test "should get new" do
    get new_author_temp_url
    assert_response :success
  end

  test "should create author_temp" do
    assert_difference("AuthorTemp.count") do
      post author_temps_url, params: { author_temp: { name: @author_temp.name, sup_id: @author_temp.sup_id } }
    end

    assert_redirected_to author_temp_url(AuthorTemp.last)
  end

  test "should show author_temp" do
    get author_temp_url(@author_temp)
    assert_response :success
  end

  test "should get edit" do
    get edit_author_temp_url(@author_temp)
    assert_response :success
  end

  test "should update author_temp" do
    patch author_temp_url(@author_temp), params: { author_temp: { name: @author_temp.name, sup_id: @author_temp.sup_id } }
    assert_redirected_to author_temp_url(@author_temp)
  end

  test "should destroy author_temp" do
    assert_difference("AuthorTemp.count", -1) do
      delete author_temp_url(@author_temp)
    end

    assert_redirected_to author_temps_url
  end
end
