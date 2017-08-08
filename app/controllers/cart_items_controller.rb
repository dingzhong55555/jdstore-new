class CartItemsController < ApplicationController

  def destroy
    @cart_item = current_cart.cart_items.find_by(product_id: params["id"])
    @product = @cart_item.product
    if @cart_item.destroy
      redirect_to :back
      flash[:notice] = "#{@product.title}已删除"
    end
  end

  def update
    @cart_item = current_cart.cart_items.find_by(product_id: params["id"])
    if @cart_item.quantity <= @cart_item.product.quantity
      @cart_item.update(cart_item_params)
      flash[:notice] = "成功变更数量"
    else
      flash[:warning] = "数量不足以加入购物车"
    end

    redirect_to :back
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end

end
