require "application_system_test_case"

class DailyChoresTest < ApplicationSystemTestCase
  setup do
    @daily_chore = daily_chores(:one)
  end

  test "visiting the index" do
    visit daily_chores_url
    assert_selector "h1", text: "Daily chores"
  end

  test "should create daily chore" do
    visit daily_chores_url
    click_on "New daily chore"

    fill_in "Chore", with: @daily_chore.chore_id
    click_on "Create Daily chore"

    assert_text "Daily chore was successfully created"
    click_on "Back"
  end

  test "should update Daily chore" do
    visit daily_chore_url(@daily_chore)
    click_on "Edit this daily chore", match: :first

    fill_in "Chore", with: @daily_chore.chore_id
    click_on "Update Daily chore"

    assert_text "Daily chore was successfully updated"
    click_on "Back"
  end

  test "should destroy Daily chore" do
    visit daily_chore_url(@daily_chore)
    click_on "Destroy this daily chore", match: :first

    assert_text "Daily chore was successfully destroyed"
  end
end
