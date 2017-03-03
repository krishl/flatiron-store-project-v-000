class CartsController < ApplicationController
  def checkout
    @cart = Cart.find(params[:id])
    @cart.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(@cart)
  end

  def show
    @cart = Cart.find(params[:id])
  end
end
