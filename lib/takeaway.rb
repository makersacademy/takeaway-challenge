require_relative './formatter'
require_relative './menu'
require_relative './dish'
require_relative './order'
require_relative './basket'
require_relative './twilio_client'
require_relative './sms'
require_relative './confirmation'
require_relative './checkout_error'
require_relative './basket_error'
require 'dotenv/load'

# check menu, add dish to basket, place order
class Takeaway

  def initialize(menu, basket = Basket.new, platform = Sms, confirmation = Confirmation, order = Order)
    @menu = menu
    @basket = basket
    @platform = platform
    @confirmation = confirmation
    @order = order
  end

  def show_menu
    @menu.list
  end

  def add_to_basket(dish_name, quantity)
    order = @order.new(@menu, dish_name, quantity)
    raise BasketError, "Dish isn't on menu" unless order.valid?

    @basket.add(order, quantity)
    "#{order.name} x#{quantity} added to basket"
  end

  def view_basket
    @basket.list
  end

  def subtotal
    raise CheckoutError, 'Basket empty' if @basket.empty?

    @basket.print_total
  end

  def checkout(total)
    raise CheckoutError, 'Basket empty' if @basket.empty?

    raise CheckoutError, 'Incorrect amount' if total != @basket.total

    @platform.new.send(@confirmation.new.message)
    @basket.empty
  end
end
