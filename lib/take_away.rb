require_relative "order"

class TakeAway

  def initialize(order_klass)
    @order = order_klass.new(Menu)
  end

  def menu
    @order.menu
  end

  def add_to_basket(dish,number)
    
    "You added #{number} x #{dish} to the basket."
  end


end
