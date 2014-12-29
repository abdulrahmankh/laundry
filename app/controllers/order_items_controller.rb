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
    order_id = params[:order_id]
    #checking that the order id was passed from the order page
    if !order_id 
      redirect_to new_order_path
      return false
    end
    #checking the the params[:order_id] is owned by the current user (from helper)
    if !current_user.check_order_ownership(order_id)
      render 'public/404.html'
      return false
    end



    @order_item = OrderItem.new(order_id: order_id)
    @order_items = OrderItem.where('order_id = ?', order_id)
    @order_id = order_id
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
