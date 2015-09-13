require_relative 'restaurant'

class Customer
  attr_reader :name, :order, :restaurant

  def initialize(restaurant = Restaurant.new)
    @restaurant = restaurant
    @order = Hash.new(0)
  end

  def place_order(dish, quantity = 1)
    raise "Please select a dish from the menu." if !restaurant.menu_include?(dish)
    order[dish] += quantity # .strip.capitalize.to_sym
    return "Thank you for ordering!"
  end

  def check_out
    fail 'Please make an order' if order.empty?
    total_cost_per_dish
    total_bill
  end

  def menu
    restaurant.view_menu
  end

  def submit_order
    restaurant.take_away
  end

  private

  def total_cost_per_dish
    order.map { |dish, quantity| "#{dish}: #{'%.2f' % (quantity * Restaurant::MENU[dish])}"}.join(", ")
  end

  def total_bill
    total_bill = 0
    order.each do |dish, quantity|
      price = Restaurant::MENU[dish] * quantity
      total_bill += price
    end
    print "Your total bill is £#{'%.2f' % total_bill}."
  end
end
