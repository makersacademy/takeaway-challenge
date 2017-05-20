class Order

  attr_reader :order_hash

  def initialize(menu = Menu.new)
    @order_hash = {}
    @menu = menu
  end

  def add_dish_to_order(dish)
    @order_hash[dish] = 1
  end

  def change_quantity_of_dish(dish, number)
    @order_hash[dish] = number
  end


  def check_order_amount(amount)
    total_of_order == amount
  end


  def total_of_order
    sum = 0
    @order_hash.each {|k,v| sum += @menu.list[k] * v}
    sum
  end
end
