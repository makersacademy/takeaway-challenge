class Order

  def initialize(menu)
    @order = []
    @menu = menu
  end

  def add(dish_number)
    @order << @menu[dish_number - 1]
  end

  def delete(dish_number)
    fail "Please enter the dish number" unless dish_number.is_a? Integer
    fail "This dish does not exist" unless @menu[dish_number - 1] && dish_number -1 >= 0
    @order.delete_at(dish_number - 1)
  end

  def total
    @order.sum { |dish| dish.price }
  end

end