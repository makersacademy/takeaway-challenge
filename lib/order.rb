#takes selection of dishes
#looks up in menu to ensure dish is valid
require_relative 'takeaway'
require_relative 'menu'

class Order

  attr_reader :items, :total, :menu

  def initialize
    @items = {}
    @total = 0
    @menu = Menu.new
  end

  def take_order
    puts "What would you like to order?"
    loop do
      print "Dish: "
      dish = gets.chomp.downcase
      until menu.dishes.key?(dish) || dish == "done"
        puts "Input is not a dish. Try again:"
        dish = gets.chomp.downcase
      end
      break if dish == "done"
      print "Quantity: "
      quantity = gets.chomp.to_i
      add_to_order(dish, quantity)
      calculate(dish, quantity)
    end
  end

  private

  attr_writer :total

  def calculate(dish, quantity)
    self.total += menu.dishes[dish] * quantity
  end

  def add_to_order(dish, quantity)
    items[dish] = quantity
  end


end
