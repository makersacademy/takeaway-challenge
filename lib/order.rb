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

end
