class Calculator
  def self.current_basket(order, dishes)
    {item_name: order.keys[0].to_s , quantity: order.values[0], subtotal: dishes.values[0] * order.values[0]}
  end
end