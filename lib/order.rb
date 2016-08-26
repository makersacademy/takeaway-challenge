class Order

  def initialize
    @order = {} # structure should be {dish => quantity}
  end

  def add_to_order(dish, quantity)
    @order[dish] = quantity
  end

  def remove_from_order(dish)
    @order.delete(dish)
  end

  def order_total
    total = 0
    @order.each_value do |value|
      total += |value|
    end
    total
  end
end
