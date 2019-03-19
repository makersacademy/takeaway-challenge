require_relative "dish"
require_relative "order"

class Menu
  attr_reader :dishes, :orders

  def initialize(orders = [], dishes = [])
    @dishes = dishes
    @orders = orders
  end
  
  def add_dish(name, price, dish_class = Dish)
    @dishes << dish_class.new(name, price)
  end

  def view_dishes
    @dishes
  end

  def select_dish(dish, quantity = 1, order_class = Order)
    if check_order_status
      @orders << order_class.new(dish, quantity) 
    else
      @orders.last.update(dish, quantity)
    end
  end

  def check_order_status
    @orders.empty? || @orders.last.confirmed?
  end
end
