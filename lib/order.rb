require 'restaurant'

class Order

  DEFAULT_BILL = @food_cost
  MENU = Restaurant::MENU

  attr_reader :dishes, :total_bill

  def initialize(total_bill = 0)
    @dishes = []
    @total_bill = total_bill
  end

  def take_order
    puts "What would you like to eat?"
    puts "Hit enter again to finalise your choice."
    # gets a 
  end

  def new_dish(dish)
    # creates a new 'dish' object
    # gets name and cost from the menu hash
    
    # search MENU for a dish name corresponding to the parameter in the method
    # name, cost = MENU[:name], MENU[:name] = cost
    # dish = Dish.new(name, cost)
  end

  def add_cost
    # adds the cost of the most recently requested meal to the total
  end

  def show_order
    # shows the user the order they have submitted
    # Food name - quantity number
  end

  def total_is_total?
    # Returns true if the total of the dishes passed as an order == total cost of the different dishes. 
  end

end
