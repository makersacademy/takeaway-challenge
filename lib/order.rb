require_relative 'menu'

class Order
  attr_reader :ordered_items, :menu

  def initialize
    @ordered_items = []
    @menu = Menu.new
  end

  def add_dish(dish_name, quantity = 1)
    dish_name = menu.dishes.select { |dish| dish[:name] == dish_name }.reduce(&:merge)
    quantity.times { @ordered_items << dish_name }
  end

  def total_cost
    
  end
  
end