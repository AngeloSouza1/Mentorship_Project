require "application_system_test_case"

class AuthorTempsTest < ApplicationSystemTestCase
  setup do
    @author_temp = author_temps(:one)
  end

  test "visiting the index" do
    visit author_temps_url
    assert_selector "h1", text: "Author temps"
  end

  test "should create author temp" do
    visit author_temps_url
    click_on "New author temp"

    fill_in "Name", with: @author_temp.name
    fill_in "Sup", with: @author_temp.sup_id
    click_on "Create Author temp"

    assert_text "Author temp was successfully created"
    click_on "Back"
  end

  test "should update Author temp" do
    visit author_temp_url(@author_temp)
    click_on "Edit this author temp", match: :first

    fill_in "Name", with: @author_temp.name
    fill_in "Sup", with: @author_temp.sup_id
    click_on "Update Author temp"

    assert_text "Author temp was successfully updated"
    click_on "Back"
  end

  test "should destroy Author temp" do
    visit author_temp_url(@author_temp)
    click_on "Destroy this author temp", match: :first

    assert_text "Author temp was successfully destroyed"
  end
end
