require_relative 'restaurant'

class Customer
  attr_reader :name, :order, :restaurant

  def initialize(restaurant = Restaurant.new)
    @restaurant = restaurant
    @order = Hash.new(0)
  end

  def menu
    restaurant.view_menu
  end

  def place_order(dish, quantity = 1)
    raise "Please select a dish from the menu." if !restaurant.menu_include?(dish)
    order[dish] += quantity
    return "Thank you for ordering."
  end

  def review_order
    raise "You haven't ordered anything." if order.empty?
    order_summary
  end

  def check_out
    fail 'Please make an order' if order.empty?
    return "Total costs: £#{final_bill}."
  end

  def submit_order
    restaurant.take_away
  end

  private

  def order_summary
    order.map { |dish, quantity| "#{dish}: #{quantity}"}.join(", ")
  end

  def final_bill
    total_bill = 0
    order.each do |dish, quantity|
      price = Restaurant::MENU[dish] * quantity
      total_bill += price
    end
    total_bill
  end

end
