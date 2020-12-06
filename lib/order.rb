class Order
  attr_reader :order_list
  def initialize
    @order_list = []
  end 

  def order_dish(dish_name, quantity = 1)
    for _ in 0...quantity
      @order_list << dish_name
    end
  end

end
