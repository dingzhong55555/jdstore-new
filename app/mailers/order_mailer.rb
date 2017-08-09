class OrderMailer < ApplicationMailer

  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email,
         subject: "感谢您在【JDstore】下单， 您的订单明细如下#{@order.token}")
  end

  def apply_to_cancel_order(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: "dingzhong55555@gmail.com",
         subject: "客户#{@user.email}申请取消订单， 订单明细如下#{@order.token}")
  end

  def notify_ship(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 您的订单 #{order.token}已发货")
  end

  def notify_cancel(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDStore] 您的订单 #{order.token}已取消")
  end


end
