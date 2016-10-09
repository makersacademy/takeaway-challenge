require_relative './dish_selection'

class OrderProcess

  attr_reader :order

  def initialize
    @order = []
    @dishes = DishSelection.new
  end

  def new_order
    @dishes.print_options_menu
    add_dishes_to_order
  end

  def add_dishes_to_order
    @order = @dishes.order
  end

  def pretty_food_list
    puts "Your Order:"
    puts ""
    @order.each { |x| puts "#{x[0]},  £#{x[1]}0"}
    puts ""
    puts "Total order:          £#{total_order}0"
  end

  def total_order
    total = 0
    @order.each { |x| total += x[1] }
    total
  end

end
