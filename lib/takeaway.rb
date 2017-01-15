require './docs/menu'

# knows how to take an order from the customer
class TakeAway

  attr_reader :order

  def initialize(order = Order.new)
    @order = order
  end

  def see_menu
    p "Menu for today #{@order.menu}"
  end

  def basket
    order.basket
  end

  def select(unit, quantity = 1)
    order.add(unit, quantity)
    basket
  end

end
