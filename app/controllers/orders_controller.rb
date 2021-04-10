class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :accept, :mark_as_complete, :cancel]

  # GET /orders
  # GET /orders.json
  def index
    if current_user and current_user.consumer?
       c_id = Consumer.find_by_user_id(current_user.id).id
       @orders = Order.where(consumer_id: c_id).order(:created_at)
    end
    if current_user and current_user.farmer?
       f_id = Farmer.find_by_user_id(current_user.id).id
       @orders = Order.where(consumer_id: f_id).order(:created_at)
       @orders = Order.where(consumer_id: f_id).where(status: params[:status]).order(:updated_at) if params[:status].present?
    end
#    @orders = Order.all.order(:created_at)
#    @orders = Order.where(status: params[:status]) if params[:status].present?
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        @line_item = LineItem.find_by_id(params[:order][:line_items_id])
        @order.line_items << @line_item
        format.html { redirect_to orders_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept
    @order.change_status(1)
    redirect_to orders_path, notice: "Order accepted"
  end

  def mark_as_complete
    @order.change_status(2)
    redirect_to orders_path, notice: "Order marked as completed"
  end

  def cancel
    @order.change_status(3)
    redirect_to orders_path, notice: "Order cancelled"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:consumer_id, :line_items_id, :note, :farmer_id)
    end
end
