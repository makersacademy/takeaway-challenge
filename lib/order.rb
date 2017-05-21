require_relative "menu"
require_relative "checkout"

class Order

attr_accessor :meal, :list_of_dishes, :order

def initialize
  @menu = Menu.new
  @checkout = Checkout.new
  @meal = []
end

  def selection_of_dish(dish, number)
    raise "Dish not in menu: please select a dish from the menu" unless @menu.list_of_dishes.has_key?(dish)
    raise "That is not a number, please enter a valid number" unless number == number.to_i
    @meal << {dish: dish, price: (@menu.list_of_dishes[dish].to_f * number)}
  end

def delete_order(dish)
  meal.delete_if { |meals| dish.include?(meals[:dish]) }
end

  def order_summary
    @checkout.show_order(@meal)
  end
end
