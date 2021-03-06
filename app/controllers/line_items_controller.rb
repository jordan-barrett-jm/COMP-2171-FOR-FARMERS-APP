class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy, :increase_quan, :decrease_quan]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @line_item = LineItem.new(line_item_params)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to ShoppingCart.user_cart(current_user), notice: 'Line item was successfully created.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { redirect_to root_path, alert: "Item could not be added to cart" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to ShoppingCart.find_by_id(@line_item.shopping_cart_id), notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def increase_quan
    @line_item.update_attributes(quantity: @line_item.quantity + 1)
    redirect_to ShoppingCart.find_by_id(@line_item.shopping_cart_id)
  end

  def decrease_quan   
    @line_item.update_attributes(quantity: @line_item.quantity - 1)
    redirect_to ShoppingCart.find_by_id(@line_item.shopping_cart_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:produce_id, :quantity, :shopping_cart_id)
    end
end
