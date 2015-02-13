class Order

  attr_reader :current_order

  def initialize
    @current_order = {}
  end

  def add_to_order(item_to_add, quantity = 1)
    @current_order[item_to_add] = quantity
  end

end