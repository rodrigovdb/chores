# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @kids = current_user.kids.includes(:chores)
  end
end
