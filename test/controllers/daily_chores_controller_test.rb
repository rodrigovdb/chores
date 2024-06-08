require "test_helper"

class DailyChoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_chore = daily_chores(:one)
  end

  test "should get index" do
    get daily_chores_url
    assert_response :success
  end

  test "should get new" do
    get new_daily_chore_url
    assert_response :success
  end

  test "should create daily_chore" do
    assert_difference("DailyChore.count") do
      post daily_chores_url, params: { daily_chore: { chore_id: @daily_chore.chore_id } }
    end

    assert_redirected_to daily_chore_url(DailyChore.last)
  end

  test "should show daily_chore" do
    get daily_chore_url(@daily_chore)
    assert_response :success
  end

  test "should get edit" do
    get edit_daily_chore_url(@daily_chore)
    assert_response :success
  end

  test "should update daily_chore" do
    patch daily_chore_url(@daily_chore), params: { daily_chore: { chore_id: @daily_chore.chore_id } }
    assert_redirected_to daily_chore_url(@daily_chore)
  end

  test "should destroy daily_chore" do
    assert_difference("DailyChore.count", -1) do
      delete daily_chore_url(@daily_chore)
    end

    assert_redirected_to daily_chores_url
  end
end
