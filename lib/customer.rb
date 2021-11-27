require_relative 'restaurant'
require_relative 'food_connect'

class Customer
  attr_reader :my_order, :my_order_price, :food_connect, :restaurant
  def initialize(restaurant = Restaurant.new, food_connect = FoodConnect.new)
    @restaurant = restaurant
    @food_connect = food_connect
    @my_order = []
    @my_order_price = []
  end

  def show_menu
    @restaurant.menu
  end

  def select_food(*choices)
    choices.each do |choice|
      @my_order << show_menu[choice]
    end
    @my_order
  end

  def check_receipt
    @my_order.each do |choice|
      @my_order_price << choice.values.shift
    end
    "£#{@my_order_price.inject(0, :+)}"
  end

  def place_order
    @food_connect.send_text
  end

end
