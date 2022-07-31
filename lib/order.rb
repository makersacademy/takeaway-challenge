require_relative 'takeaway'
class Order < Menu
  
  attr_accessor :dishes, :my_choices, :cart, :menu
  def initialize
  @my_order = {}
  @cart = []
  end
  

  def add_dish_to_order(dish, quantity)
    @my_order = {dish => quantity }
    @add_to_cart
  end

  def add_to_cart
    @cart.push(@my_order)
  end

  def total_cost
    total = 0
    @cart.each { |each_dish| 
      each_dish.each { |dish, quantity| 
      total = total + (quantity * @menu.dishes[dish])
    }
  end

end

# m = Order.new
# puts m.foods_ordered(chicken, 2)


#  food = Order.new
# puts food.foods_ordered('chicken', 2)
# puts food.mychoice


