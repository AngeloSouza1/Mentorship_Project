require "application_system_test_case"

class AssembliesPartsTest < ApplicationSystemTestCase
  setup do
    @assemblies_part = assemblies_parts(:one)
  end

  test "visiting the index" do
    visit assemblies_parts_url
    assert_selector "h1", text: "Assemblies parts"
  end

  test "should create assemblies part" do
    visit assemblies_parts_url
    click_on "New assemblies part"

    fill_in "Rails env=montadora development", with: @assemblies_part.RAILS_ENV=montadora_development
    fill_in "Assembly", with: @assemblies_part.assembly_id
    fill_in "Part", with: @assemblies_part.part_id
    click_on "Create Assemblies part"

    assert_text "Assemblies part was successfully created"
    click_on "Back"
  end

  test "should update Assemblies part" do
    visit assemblies_part_url(@assemblies_part)
    click_on "Edit this assemblies part", match: :first

    fill_in "Rails env=montadora development", with: @assemblies_part.RAILS_ENV=montadora_development
    fill_in "Assembly", with: @assemblies_part.assembly_id
    fill_in "Part", with: @assemblies_part.part_id
    click_on "Update Assemblies part"

    assert_text "Assemblies part was successfully updated"
    click_on "Back"
  end

  test "should destroy Assemblies part" do
    visit assemblies_part_url(@assemblies_part)
    click_on "Destroy this assemblies part", match: :first

    assert_text "Assemblies part was successfully destroyed"
  end
end
