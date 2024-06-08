class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def index
    @chores = Chore.all
    @daily_chores = DailyChore.for_this_week
    @week = Date.current.beginning_of_week..Date.current.end_of_week
  end
end
