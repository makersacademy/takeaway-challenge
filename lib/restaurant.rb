require_relative 'dish'
require_relative 'order'


class Restaurant

  attr_reader :menu, :order

  def initialize
    @menu = []
  end

  def create_dish(name, price)
    dish = Dish.new(name, price)
    @menu << dish
  end

  def display_menu
    @menu.each { |object|
    puts "- #{object.details[:name]} | #{object.details[:price]} pounds  \n"
    }
  end

  def create_order

    puts "Enter the name of the food you want to order"
    name = gets.chomp
    #decodes the price of the name from menu
    puts "Enter the amount"
    amount = gets.chomp
    price =     #decodes the price of the name from menu
    order = Order.new
    order.add_items(name, price, amount)
    return order
  end


private


end
