# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @kids = current_user.kids.includes(:daily_chores, :chores)
    @chores = current_user.chores
  end
end
