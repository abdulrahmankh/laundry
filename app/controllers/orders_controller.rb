class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  before_action :set_customer

  respond_to :html

  def index
    @orders = current_user.orders
    respond_with(@orders)
  end

  def show
    respond_with(@order)
  end

  def new
    @order = Order.new
    respond_with(@order)
  end

  def edit
  end

  def create

    @order = Order.new(order_params)
    @order.user = current_user
    @order.save
    
    redirect_to new_order_item_path(order_id: @order.id)
  end

  def update
    @order.update(order_params)
    respond_with(@order)
  end

  def destroy
    @order.destroy
    respond_with(@order)
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def set_customer
      @customers = Customer.all
    end


    def order_params
      params.require(:order).permit(:customer_id, :user_id, :total_price)
    end
end
