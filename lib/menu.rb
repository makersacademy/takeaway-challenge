require_relative "dish"
require_relative "order"

class Menu
  attr_reader :dishes, :current_order

  def initialize
    @dishes = Array.new
  end

  def add_dish(dish)
    dishes << dish
  end

  def display
    dishes.each do |dish|
      puts "#{dish.name} £#{dish.price}"
    end
  end

  def new_order
    @current_order = Order.new
  end

  def order(item)
    current_order.add(dishes.find{ |dish| dish.name == item})
    puts "#{item} added to order"
  end
end
