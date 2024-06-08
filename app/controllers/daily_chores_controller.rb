# frozen_string_literal: true

class DailyChoresController < ApplicationController
  before_action :set_daily_chore, only: %i[show edit update destroy]

  # GET /daily_chores or /daily_chores.json
  def index
    @daily_chores = DailyChore.all
  end

  # GET /daily_chores/1 or /daily_chores/1.json
  def show; end

  # GET /daily_chores/new
  def new
    @daily_chore = DailyChore.new
  end

  # GET /daily_chores/1/edit
  def edit; end

  # POST /daily_chores or /daily_chores.json
  def create
    @daily_chore = DailyChore.new(daily_chore_params)

    respond_to do |format|
      if @daily_chore.save
        format.html { redirect_to daily_chore_url(@daily_chore), t('controllers.daily_chores.create') }
        format.json { render :show, status: :created, location: @daily_chore }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @daily_chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_chores/1 or /daily_chores/1.json
  def update
    respond_to do |format|
      if @daily_chore.update(daily_chore_params)
        format.html { redirect_to daily_chore_url(@daily_chore), t('controllers.daily_chores.update') }
        format.json { render :show, status: :ok, location: @daily_chore }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @daily_chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_chores/1 or /daily_chores/1.json
  def destroy
    @daily_chore.destroy

    respond_to do |format|
      format.html { redirect_to daily_chores_url, notice: t('controllers.daily_chores.destroy') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_daily_chore
    @daily_chore = DailyChore.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def daily_chore_params
    params.require(:daily_chore).permit(:chore_id)
  end
end
