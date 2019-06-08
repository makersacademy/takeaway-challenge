class CostCalculator

  attr_reader :total_price

  def initialize
    @total_price = 0
  end

  def calculate(current_order, menu_contents)
    current_order.each do |index|
      @total_price += price_for_quantity(index, menu_contents)
    end
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
