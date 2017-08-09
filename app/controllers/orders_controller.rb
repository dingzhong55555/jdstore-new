class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price
    if @order.save

      current_cart.cart_items.each do |cart_item|
        product_list = ProductList.new
        product_list.order = @order
        product_list.product_name = cart_item.product.title
        product_list.product_price = cart_item.product.price
        product_list.quantity = cart_item.quantity
        product_list.save
      end
      redirect_to order_path(@order.token)
    else
      redirect_to 'carts/checkout'
    end
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def pay_with_alipay
    @order = Order.find_by_token(params[:id])
    @order.paid!
    @order.set_payment_with!("alipay")

    redirect_to :back
    current_cart.clean!
    flash[:warning] = "支付宝付款成功！"
  end

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
    @order.paid!
    @order.set_payment_with!("wechat")
    redirect_to :back
    current_cart.clean!
    flash[:warning] = "微信付款成功！"
  end

  private

    def order_params
      params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
    end
end
