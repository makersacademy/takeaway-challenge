require_relative 'restaurant'
require_relative 'message_sender'

class Customer

  attr_reader :restaurant

  def initialize
    @restaurant = Restaurant.new
  end

  def view_menu
    restaurant.menu
  end

  def select_dishes dish, quantity
    restaurant.dishes_can_be_selected dish, quantity
  end

  def check_total_amount
    restaurant.give_total_amount
  end

  def order_confirmation
    restaurant.text_message_is_send
  end
end