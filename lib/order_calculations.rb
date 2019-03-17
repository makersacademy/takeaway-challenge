module OrderCalculations

  def self.dish_price(order_hash)
    order_hash[:dish].price
  end

  def self.dish_number(order_hash)
    order_hash[:quantity]
  end

  def self.calculate_total(order)
    cost = 0
    order.orderlines.each do |order_hash|
      cost += dish_price(order_hash) * dish_number(order_hash)
    end
    cost
  end

  def self.check_total(user_total, order)
    calculate_total(order) == user_total
  end
end
