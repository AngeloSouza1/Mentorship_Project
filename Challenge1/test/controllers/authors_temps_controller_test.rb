require "test_helper"

class AuthorsTempsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @authors_temp = authors_temps(:one)
  end

  test "should get index" do
    get authors_temps_url
    assert_response :success
  end

  test "should get new" do
    get new_authors_temp_url
    assert_response :success
  end

  test "should create authors_temp" do
    assert_difference("AuthorsTemp.count") do
      post authors_temps_url, params: { authors_temp: { name: @authors_temp.name } }
    end

    assert_redirected_to authors_temp_url(AuthorsTemp.last)
  end

  test "should show authors_temp" do
    get authors_temp_url(@authors_temp)
    assert_response :success
  end

  test "should get edit" do
    get edit_authors_temp_url(@authors_temp)
    assert_response :success
  end

  test "should update authors_temp" do
    patch authors_temp_url(@authors_temp), params: { authors_temp: { name: @authors_temp.name } }
    assert_redirected_to authors_temp_url(@authors_temp)
  end

  test "should destroy authors_temp" do
    assert_difference("AuthorsTemp.count", -1) do
      delete authors_temp_url(@authors_temp)
    end

    assert_redirected_to authors_temps_url
  end
end
