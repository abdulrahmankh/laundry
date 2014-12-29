class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @payments = Payment.all
    respond_with(@payments)
  end

  def show
    respond_with(@payment)
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

    @payment = Payment.new(order_id: order_id)
    @order = Order.find_by_id(order_id)
    @order_items = OrderItem.where('order_id = ?', order_id)
    
    respond_with(@payment)
  end

  def edit
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user = current_user
    @payment.save
    respond_with(@payment)
  end

  def update
    @payment.update(payment_params)
    respond_with(@payment)
  end

  def destroy
    @payment.destroy
    respond_with(@payment)
  end

  private
    def set_payment
      @payment = Payment.find(params[:id])
    end

    def payment_params
      params.require(:payment).permit(:order_id, :amount, :method)
    end
end
