require_relative 'restaurant.rb'

class Customer

  attr_reader :phone_number, :live_restaurant, :user_selection

  def initialize(phone_number = 'ENV', restaurant = Restaurant.new)
    @phone_number = phone_number
    @live_restaurant = restaurant
    @user_selection = ['Tikka_Masala', 'Naan'] # Default values for testing
  end

  def request_menu(restaurant = live_restaurant)
    restaurant.the_menu
  end

  def make_selection(customer_number = phone_number, selection = user_selection)
    live_restaurant.confirm_selection(customer_number, selection)
  end

  def confirm_total
    live_restaurant.confirm_total
  end

  def confirm_order
    live_restaurant.send_confirmation_text
  end

end
