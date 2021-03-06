require "application_system_test_case"

class ProducesTest < ApplicationSystemTestCase
  setup do
    @produce = produces(:one)
  end

  test "visiting the index" do
    visit produces_url
    assert_selector "h1", text: "Produces"
  end

  test "creating a Produce" do
    visit produces_url
    click_on "New Produce"

    check "Available" if @produce.available
    fill_in "Description", with: @produce.description
    fill_in "Farm", with: @produce.farm_id
    fill_in "Images", with: @produce.images
    fill_in "Name", with: @produce.name
    click_on "Create Produce"

    assert_text "Produce was successfully created"
    click_on "Back"
  end

  test "updating a Produce" do
    visit produces_url
    click_on "Edit", match: :first

    check "Available" if @produce.available
    fill_in "Description", with: @produce.description
    fill_in "Farm", with: @produce.farm_id
    fill_in "Images", with: @produce.images
    fill_in "Name", with: @produce.name
    click_on "Update Produce"

    assert_text "Produce was successfully updated"
    click_on "Back"
  end

  test "destroying a Produce" do
    visit produces_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Produce was successfully destroyed"
  end
end
