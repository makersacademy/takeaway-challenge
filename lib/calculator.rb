class Calculator
  def self.current_basket(order, dishes)
    item = order.keys[0].to_s
    quantity = order.values[0]
    price = dishes.values[0]
    subtotal = quantity * price
    {item_name: item , quantity: quantity, subtotal: subtotal}
  end
end