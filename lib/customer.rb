require_relative 'order'

class Customer

  attr_accessor :phone_number, :name, :restaurant, :order
  attr_reader :user_input_module

  def initialize (name="Customer Name", number="+4407777777777")
    @name = name
    @phone_number = number
  end

  def select_restaurant restaurant
    @restaurant = restaurant
  end

  def request_menu
      restaurant.display_menu
  end

  def create_order (orderClass=Order)
    @order = orderClass.new
  end

  def update_order food_item, num=1
    order.add restaurant, food_item, num
  end

  def submit_order
    restaurant.send_text self
  end

end
