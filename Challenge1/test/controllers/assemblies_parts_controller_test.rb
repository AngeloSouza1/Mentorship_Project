require "test_helper"

class AssembliesPartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assemblies_part = assemblies_parts(:one)
  end

  test "should get index" do
    get assemblies_parts_url
    assert_response :success
  end

  test "should get new" do
    get new_assemblies_part_url
    assert_response :success
  end

  test "should create assemblies_part" do
    assert_difference("AssembliesPart.count") do
      post assemblies_parts_url, params: { assemblies_part: { RAILS_ENV=montadora_development: @assemblies_part.RAILS_ENV=montadora_development, assembly_id: @assemblies_part.assembly_id, part_id: @assemblies_part.part_id } }
    end

    assert_redirected_to assemblies_part_url(AssembliesPart.last)
  end

  test "should show assemblies_part" do
    get assemblies_part_url(@assemblies_part)
    assert_response :success
  end

  test "should get edit" do
    get edit_assemblies_part_url(@assemblies_part)
    assert_response :success
  end

  test "should update assemblies_part" do
    patch assemblies_part_url(@assemblies_part), params: { assemblies_part: { RAILS_ENV=montadora_development: @assemblies_part.RAILS_ENV=montadora_development, assembly_id: @assemblies_part.assembly_id, part_id: @assemblies_part.part_id } }
    assert_redirected_to assemblies_part_url(@assemblies_part)
  end

  test "should destroy assemblies_part" do
    assert_difference("AssembliesPart.count", -1) do
      delete assemblies_part_url(@assemblies_part)
    end

    assert_redirected_to assemblies_parts_url
  end
end
