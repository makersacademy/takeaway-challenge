require_relative "menu"
class Order

attr_accessor :meal, :list_of_dishes #:order

def initialize
  @menu = Menu.new
  @meal = []
end

def selection_of_dish(dish, number)
  raise "Dish not in menu: please select a dish from the menu" unless @menu.list_of_dishes.has_key?(dish)
  raise "That is not a number, please enter a valid number" unless number == number.to_i
  @meal << {dish: dish, price: (@menu.list_of_dishes[dish].to_f * number)}
end

def show_order
  print "You have selected #{meal.length} dishes: "
  print_order
  calculate_total
end

def delete_order(dish)
  meal.delete_if { |meals| dish.include?(meals[:dish]) }
end

private

def print_order
  print "#{meal.map {|s| puts "#{s[:dish]} at £#{s[:price] }" }}."
end

def calculate_total
  print "This gives you a total price of £#{(sprintf "%.2f", (meal.map {|s| s[:price]}.inject(0, :+)))}"
end
end
