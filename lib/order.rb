

class Order
  attr_reader :menu, :order

  def initialize
    @order = {}
  end

  def add(dish, quantity)
    @order[dish] = quantity
  end


  def price(dish)
    @menu[dish]
  end


end
