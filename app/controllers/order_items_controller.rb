class OrderItemsController < ApplicationController
  before_action :set_products
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @order_items = OrderItem.all
    respond_with(@order_items)
  end

  def show
    respond_with(@order_item)
  end

  def new
    @order_item = OrderItem.new(order_id: params[:order_id])
    @order_items = OrderItem.all
    respond_with(@order_item)
  end

  def edit
  end

  def create
    @order_item = OrderItem.new(order_item_params)
    if @order_item.save
      redirect_to new_order_item_path(order_id: @order_item.order_id) 
    else
      error_message = ''
      @order_item.errors.full_messages.each {|e| error_message = "#{error_message}, #{e}"  }
      redirect_to new_order_item_path(order_id: @order_item.order_id), alert: error_message
    end

  end

  def update
    @order_item.update(order_item_params)
    respond_with(@order_item)
  end

  def destroy
    @order_item.destroy
     redirect_to new_order_item_path(order_id: @order_item.order_id)
  end

  private
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def order_item_params
      params.require(:order_item).permit(:order_id, :product_id, :quantity)
    end

    def set_products
      @products = Product.all
    end
end
