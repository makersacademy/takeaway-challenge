require_relative "menu"
class Order

attr_accessor :meal, :list_of_dishes #:order

def initialize
  @menu = Menu.new
  @meal = []
end

def show_menu
  menu.list_of_dishes
end

def selection_of_dish(dish, number)
  raise "Dish not in menu: please select a dish from the menu" unless @menu.list_of_dishes.has_key?(dish)
  raise "That is not a number, please enter a valid number" unless number == number.to_i
  @meal << {dish: dish, amount: number}
end

def user_order
#   list_of_dishes.select{|key, hash| hash["client_id"] == "2180" }
  # @meal[-1]
end

# def amount(number)
#   # if number == 1
#   #   puts "You have ordered #{number} #{@meal[-1]} dish"
#   # else
#   #   puts "You have ordered #{number} #{@meal[-1]} dishes"
#   # end
# end

# private
#
# def record_order
#   @order << @meals
# end
end
