# The TotalChecker module
module TotalChecker

  def self.check_basket_total(takeaway_order)
    final_total = 0
    takeaway_order.list_of_dishes.each { |takeaway_dish, amount_of_each_dish_ordered| final_total += (takeaway_dish.price * amount_of_each_dish_ordered) }
    final_total == takeaway_order.current_order_cost
  end
end
