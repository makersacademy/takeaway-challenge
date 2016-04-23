class OrderCalculator

  def verified?(total, dishes_ordered)
    total == calculate_price(dishes_ordered)
  end

  private

  def calculate_price(dishes_ordered)
    order_sum = 0
    dishes_ordered.each do |item_hash|
      order_sum += item_hash[:dish].price * item_hash[:quantity]
    end
    order_sum
  end
end
