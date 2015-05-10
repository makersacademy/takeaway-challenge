require 'time'

class Customer

  attr_accessor :name
  attr_accessor :dishes
  attr_reader :restaurant
  attr_reader :menu

  def initialize(name = 'Customer')
    @name = name
    @restaurant = restaurant
  end

  def view_menu(restaurant)
    @restaurant = restaurant
    @menu = restaurant.menu
  end

  def choose_dishes(*dishes)
    @restaurant.receive_order(dishes)
    @dishes = dishes
    @dishes
  end

  def choose_amount(*amount)
    @restaurant.calculate_order(amount)
  end

  def view_order
    @restaurant.order_review
  end

  def place_order
    @restaurant.valid_order?
    require_relative 'twilio-ruby'
  end
end