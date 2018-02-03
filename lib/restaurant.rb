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
    order = Order.new
    puts "Enter the name of the food you want to order. If you want to stop ordering, click return two times"
    @given_name = gets.chomp
    puts "Enter the amount"
    given_amount = gets.chomp
    while !@given_name.empty? && !given_amount.empty? do
      price = find_price()
      order.add_items(@given_name, price, given_amount)
      puts "Enter the name of the food you want to order"
      @given_name = gets.chomp
      puts "Enter the amount"
      given_amount = gets.chomp
    end
    return order
  end

  def find_price
    @menu.each { |object|
    if object.details[:name] = @given_name then
      return object.details[:price]
    end
    }
  end

end
