class CartsController < ApplicationController

  def index
    @cart_items = current_cart.cart_items
  end

  def clean
    current_cart.clean!
    flash[:warning] = "已清空购物车"
    redirect_to :back
  end

  def checkout
    @cart_items = current_cart.cart_items
    @order = Order.new
  end

end
