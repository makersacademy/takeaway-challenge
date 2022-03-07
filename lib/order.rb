class Order
  attr_writer :time_of_order

  def initialize(menu)
    @order = []
    @menu = menu
  end

  def add(dish_number)
    @order << @menu[dish_number - 1]
  end

  def delete(dish_number)
    fail "Please enter the dish number" unless dish_number.is_a? Integer
    fail "This dish does not exist" unless exists?(dish_number)
    @order.delete_at(dish_number - 1)
  end

  def total
    @order.sum { |dish| dish.price }
  end

  private

  def exists?(dish_number)
    0 <  dish_number <= @menu.length
  end

end