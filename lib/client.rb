require_relative 'restaurant.rb'


class Client

  attr_reader :name, :phone_number

  def initialize(name, phone_number)
    @name = name
    @phone_number = phone_number
  end

  def require_menu(restaurant)
    restaurant.give_menu
  end

  def check_order(_order = Order.new)
    true
  end

end
