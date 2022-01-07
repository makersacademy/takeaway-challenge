class CustomerInterface

  attr_reader :menu, :order

  def initialize
    @menu = [{dish: "Katsu Chicken Curry", price: 7.99}, {dish: "Sushi Platter", price: 21.99}]
    @order = Order.new
  end

  def print_menu
    puts @menu
  end

  def select_dish(dish)
    @order.add_dish(dish)
  end

  def remove_dish(dish)
    @order.remove_dish(dish)
  end

  def check_order
    puts @order.dishes
    puts @order.total_cost
    puts @order.total_prep_time
  end

  def checkout
    puts "Thank you, your order has been placed"
  end

end