#takes selection of dishes
#looks up in menu to ensure dish is valid
require_relative 'interface'
require_relative 'menu'

class Order

  attr_reader :items

  def initialize
    @items = []
  end

  def take_order
    puts "What would you like to order?"
    loop do
      print "Dish: "
      dish = gets.chomp.downcase
      break if dish == "done"
      print "Quantity: "
      quantity = gets.chomp.to_i
      add_to_order(dish, quantity)
    end
  end

  private

  def add_to_order(dish, quantity)
    items << {dish => quantity}
  end


end
