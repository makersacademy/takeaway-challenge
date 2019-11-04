require_relative 'menus'
require_relative 'order'

class Takeaway

  attr_reader :order, :basket

  def initialize(cuisine = Pizza)
    @cuisine = cuisine.new
    @order = Order.new
    @basket = @order.basket
  end

  def view_menu
    @cuisine.menu
  end

  def select(dish, quantity)
    price = @cuisine.menu[dish]
    @order.add_to_basket(dish, price, quantity)
  end

  def confirm_total(amount)
    @order.confirm_total(amount)
  end

end
