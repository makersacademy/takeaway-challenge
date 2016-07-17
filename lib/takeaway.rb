require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :new_order, :price

  def initialize
    @menu = Menu.new.menu
  end

  def order(price, *food)
    @food = food
    @new_order = Order.new(food)
    @price = new_order.current_order
    raise "That price doesn't match the food order" if price != @price
    complete
  end

  def complete
    puts "You have selected #{@food.join(", ")}, totally #{@price}, complete?"
  end

end
