require "application_system_test_case"

class AuthorsTempsTest < ApplicationSystemTestCase
  setup do
    @authors_temp = authors_temps(:one)
  end

  test "visiting the index" do
    visit authors_temps_url
    assert_selector "h1", text: "Authors temps"
  end

  test "should create authors temp" do
    visit authors_temps_url
    click_on "New authors temp"

    fill_in "Name", with: @authors_temp.name
    click_on "Create Authors temp"

    assert_text "Authors temp was successfully created"
    click_on "Back"
  end

  test "should update Authors temp" do
    visit authors_temp_url(@authors_temp)
    click_on "Edit this authors temp", match: :first

    fill_in "Name", with: @authors_temp.name
    click_on "Update Authors temp"

    assert_text "Authors temp was successfully updated"
    click_on "Back"
  end

  test "should destroy Authors temp" do
    visit authors_temp_url(@authors_temp)
    click_on "Destroy this authors temp", match: :first

    assert_text "Authors temp was successfully destroyed"
  end
end
