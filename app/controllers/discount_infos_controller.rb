class DiscountInfosController < ApplicationController
  before_action :set_discount_info, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @discount_infos = DiscountInfo.all
    respond_with(@discount_infos)
  end

  def show
    respond_with(@discount_info)
  end

  def new
    @discount_info = DiscountInfo.new
    respond_with(@discount_info)
  end

  def edit
  end

  def create
    @discount_info = DiscountInfo.new(discount_info_params)
    @discount_info.save
    respond_with(@discount_info)
  end

  def update
    @discount_info.update(discount_info_params)
    respond_with(@discount_info)
  end

  def destroy
    @discount_info.destroy
    respond_with(@discount_info)
  end

  private
    def set_discount_info
      @discount_info = DiscountInfo.find(params[:id])
    end

    def discount_info_params
      params.require(:discount_info).permit(:amount, :discount, :active)
    end
end
