require_relative "dish"
require_relative "order"

class Menu
  attr_reader :dishes # <- made attr_reader so could publicly call to add dish to order from irb

  def initialize
    @dishes = []
    @orders = []
  end
  
  def add_dish(name, price, dish_class = Dish)
    @dishes << dish_class.new(name, price)
  end

  def view_dishes
    @dishes
  end

  def select_dish(dish, quantity = 1, order_class = Order)
    if @orders.empty? || @orders.last.confirmed?
      @orders << order_class.new(dish, quantity)
    else
      @orders.last.update(dish, quantity)
    end
    @orders.last
  end
end
