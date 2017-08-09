class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout 'admin'

  def index
    @orders = Order.order("id DESC")
  end
  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end
end
