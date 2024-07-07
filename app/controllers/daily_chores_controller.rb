# frozen_string_literal: true

class DailyChoresController < ApplicationController
  before_action :set_chores_for_the_week, only: %i[index create]
  before_action :set_daily_chore, only: %i[destroy]

  # GET /daily_chores or /daily_chores.json
  def index; end

  # GET /daily_chores/new
  def new
    @daily_chore = DailyChore.new(created_at: Time.current)
  end

  # POST /daily_chores or /daily_chores.json
  def create
    @daily_chore = DailyChore.where(daily_chore_params).first_or_initialize

    respond_to do |format|
      if @daily_chore.save
        format.turbo_stream
      end
    end
  end

  # DELETE /daily_chores/1 or /daily_chores/1.json
  def destroy
    @daily_chore.destroy

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_chores_for_the_week
    @chores = Chore.all
    @daily_chores = DailyChore.for_this_week
    @week = Date.current.all_week
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_daily_chore
    @daily_chore = DailyChore.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def daily_chore_params
    params.require(:daily_chore).permit(:chore_id, :created_at)
  end
end
