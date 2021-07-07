class CostCalculator

  def calculate(current_order, menu_contents)
    cost_of_order = 0
    current_order.each do |index|
      cost_of_order += price_for_quantity(index, menu_contents)
    end
    cost_of_order
  end

  def price_for_dish(order_hash, menu_contents)
    menu_contents[order_hash["dish"]]
  end

  def quantity_of_dish(order_hash)
    order_hash["quantity"]
  end

  def price_for_quantity(order_hash, menu)
    price_for_dish(order_hash, menu) * quantity_of_dish(order_hash)
  end

end
