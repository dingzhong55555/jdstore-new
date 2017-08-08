class CartItemsController < ApplicationController

  def destroy
    @cart_item = current_cart.cart_items.find_by(product_id: params["id"])
    @product = @cart_item.product
    if @cart_item.destroy
      redirect_to :back
      flash[:notice] = "#{@product.title}已删除"
    end
  endd

  def update
    @cart_item = current_cart.cart_items.find_by(product_id: params["id"])
    @cart_item.update(cart_item_params)
    redirect_to :backd
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end

end
