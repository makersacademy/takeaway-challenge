class Order
attr_reader :dishes, :current_order

  def initialize(dishes)
    @dishes = dishes
    @current_order = {}
  end

  def select_dish(dish, num)
    raise "There is no #{dish} in the list. Please select a dish from the list." if !dishes.include?(dish)
    @current_order[dish] = num
    "You added #{num} #{dish} to your order."
  end

  def total
    (dishes.keys & current_order.keys).map {|d| dishes[d] * current_order[d]}.inject(:+)
  end

  def verify_total(user_total)
    user_total == total ? true : false
  end

end
