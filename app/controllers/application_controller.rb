# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def index
    @chores = Chore.all
    @daily_chores = DailyChore.for_this_week
    @week = Date.current.all_week
  end
end
