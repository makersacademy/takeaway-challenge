require_relative 'order'

class Customer

  attr_accessor :phone_number, :name, :restaurant, :order
  attr_reader :user_input_module

  def initialize (name, number)
    @name = name
    @phone_number = number
  end

  def select_restaurant restaurant
    @restaurant = restaurant
  end

  def request_menu
    restaurant.display_menu
  end

  def create_order (order_class)
    @order = order_class.new
  end

  def update_order food_item, num=1
    order.add restaurant, food_item, num
  end

  def display_order
    order.display_order restaurant
  end

  def submit_order
    restaurant.send_text self
  end

end
