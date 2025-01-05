# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @kids = current_user.kids.includes(:chores)
  end

  def streak_for(kid)
    StreakService.call(kid:)
  end
  helper_method :streak_for
end
