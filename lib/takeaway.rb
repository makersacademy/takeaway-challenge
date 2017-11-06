require_relative 'order'

class Takeaway
  attr_reader :order, :menu

  DISHES = {
    pizza: 5,
    sausage: 3,
    chicken: 4,
    curry: 7,
    family_deal: 15
  }

  def initialize(order = Order.new)
    @order = order
  end

  def menu
    DISHES
  end

  def select(dish, quantity)
    @order.add_to_order(dish, quantity)
  end

  def basket
    @order.breakdown
  end

  def checkout(amount)
    @order.pay(amount)
    reset_order
  end

  private
  
  def reset_order
    @order = Order.new
  end

end
