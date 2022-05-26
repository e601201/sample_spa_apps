class FoodsController < ApplicationController
  skip_before_action :require_login, only: :index
  before_action :set_food, only: %i[ show edit update destroy ]
  before_action :hash_kind_id_and_name, only: %i[new edit]

  # GET /foods or /foods.json
  def index
    @q = Food.ransack(params[:q])
    @foods = @q.result.includes(:kind).page(params[:page]).per(params[:per] || 6)
  end

  # GET /foods/1 or /foods/1.json
  def show;end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit;end

  # POST /foods or /foods.json
  def create
    authorize! @food
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to food_url(@food), notice: "Food was successfully created." }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    authorize! @food
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: "Food was successfully updated." }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    authorize! @food
    @food.destroy!

    respond_to do |format|
      format.html { redirect_to foods_url, notice: "Food was successfully destroyed." }
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
    #このコードが死ぬほど気に食わないので、いい感じに書き直せる方法を模索中。そして募集中
    def hash_kind_id_and_name
      @hash_kind_id_and_name = {}
      kinds = Kind.all
      kinds.each {|k| @hash_kind_id_and_name[k.id] = k.name}
    end
end
