require_relative 'menu'

class Order
  attr_reader :ordered_items, :menu, :total

  def initialize
    @ordered_items = []
    @menu = Menu.new
    @total = 0
  end

  def add_dish(dish_name, quantity = 1)
    dish_name = menu.dishes.select { |dish| dish[:name] == dish_name }.reduce(&:merge)
    quantity.times { @ordered_items << dish_name }
  end

  def display_order
    puts @ordered_items.each { |dish| "#{dish[:name]} £#{dish[:price]}"}
  end

  def total_cost
    @ordered_items.each { |dish| @total += dish[:price] }
    @total
  end

  

end