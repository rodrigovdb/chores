# frozen_string_literal: true

class KidsController < ApplicationController
  before_action :set_kid, only: %i[show edit update destroy]
  before_action :set_form_section, only: %i[edit update]

  # GET /kids or /kids.json
  def index
    @kids = current_user.kids.order(name: :asc)
  end

  # GET /kids/1 or /kids/1.json
  def show; end

  # GET /kids/new
  def new
    @kid = Kid.new
  end

  # GET /kids/1/edit
  def edit
    @chores = Chore.all
  end

  # POST /kids or /kids.json
  def create
    @kid = Kid.new(kid_params.merge(user: current_user))

    respond_to do |format|
      if @kid.save
        format.html { redirect_to kid_url(@kid), notice: t('controllers.create', name: Kid.model_name.human) }
        format.json { render :show, status: :created, location: @kid }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kids/1 or /kids/1.json
  def update
    respond_to do |format|
      if @kid.update(kid_params)
        format.html { redirect_to kid_url(@kid), notice: t('controllers.update', name: Kid.model_name.human) }
        format.json { render :show, status: :ok, location: @kid }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kids/1 or /kids/1.json
  def destroy
    @kid.destroy

    respond_to do |format|
      format.html { redirect_to kids_url, notice: t('controllers.destroy', name: Kid.model_name.human) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_kid
    @kid = Kid.find(params[:id])
  end

  def set_form_section
    @form_section = (params[:section] || :name).to_sym
  end

  # Only allow a list of trusted parameters through.
  def kid_params
    params.require(:kid).permit(:name)
  end
end
