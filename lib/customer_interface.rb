class CustomerInterface

  attr_reader :menu, :order

  def initialize
    @menu = [{dish: "Katsu Chicken Curry", price: 7.99}, {dish: "Sushi Platter", price: 21.99}]
    @order = []
  end

  def print_menu
    puts @menu
  end

  def select_dish(dish)
    @order << dish
  end

  def remove_dish(dish)
    order.delete_at(order.index(dish))
  end

  def check_order
    puts @order
  end

  def checkout
    puts "Thank you, your order has been placed"
    @order = []
  end

end