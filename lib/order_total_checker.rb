module OrderTotalChecker

  def self.check_total(order)
    correct_total = 0
    order.ordered_dishes.each { |dish, quantity| correct_total += (dish.price * quantity)  }
    correct_total == order.expected_order_total
  end
end
