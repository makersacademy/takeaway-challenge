require_relative "dish"
require_relative "order"

class Menu
  attr_reader :current_order, :name, :dishes
  DISH_TYPES = ["Starter", "Main course", "Dessert"]

  def initialize(name)
    @dishes = Array.new
    @name = name
    @current_order = Order.new
  end

  def add_dish(dish)
    dishes << dish
  end

  def display
    DISH_TYPES.each { |type| dish_displayer(type) }
  end

  def order(item)
    raise "That item is not on the menu" unless dishes.map { |dish| dish.name }.include?(item)
    @current_order = Order.new if current_order.complete?
    current_order.add(dishes.find { |dish| dish.name == item })
    puts "#{item} added to order"
  end

  private

  def dish_displayer(type)
    puts "#{type.capitalize}s:"
    dishes.select {|dish| dish.type == type.capitalize }.each do |dish|
      puts "#{dish.name} £#{dish.price}"
    end
  end

end
