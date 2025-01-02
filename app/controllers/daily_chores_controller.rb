# frozen_string_literal: true

class DailyChoresController < ApplicationController
  before_action :set_kid
  before_action :set_daily_chore, only: %i[destroy]
  before_action :set_chore_and_day, only: %i[destroy]
  after_action :set_chore_and_day, only: %i[create]

  # GET /daily_chores or /daily_chores.json
  def index
    @week = (params[:date]&.to_date || Date.current).all_week
    @daily_chores = @kid.daily_chores.for_week(@week)
  end

  # GET /daily_chores/new
  def new
    @daily_chore = DailyChore.new(created_at: Time.current)
  end

  # POST /daily_chores or /daily_chores.json
  def create
    @daily_chore = DailyChore.where(daily_chore_params.merge(kid_id: @kid.id)).first_or_initialize

    respond_to do |format|
      format.turbo_stream if @daily_chore.save
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

  def set_kid
    @kid = Kid.find(params[:kid_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_daily_chore
    @daily_chore = DailyChore.find(params[:id])
  end

  def set_chore_and_day
    @chore = @daily_chore.chore
    @day = @daily_chore.created_at.to_date
  end

  # Only allow a list of trusted parameters through.
  def daily_chore_params
    params.require(:daily_chore).permit(:chore_id, :created_at)
  end
end
