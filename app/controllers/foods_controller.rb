class FoodsController < ApplicationController
  skip_before_action :require_login, only: :index
  before_action :set_food, only: %i[show edit update destroy]
  before_action :set_authorize, only: %i[create update destroy]

  # GET /foods or /foods.json
  def index
    @q = Food.ransack(params[:q])
    @foods = @q.result.includes(:kind).page(params[:page]).order(created_at: :desc).per(params[:per] || 6)
  end

  # GET /foods/1 or /foods/1.json
  def show; end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit; end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)
    respond_to do |format|
      if @food.save
        format.html { redirect_to food_url(@food), notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    if @food.update(food_params)
      flash.now[:success] = 'Food was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy!
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :kind_id, :price, :memo, :is_deleted, :deleted_at)
  end

  def set_authorize
    authorize! @food
  end
end
