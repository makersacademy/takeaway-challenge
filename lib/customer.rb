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
    return "Thank you for ordering. Your order so far is #{total_cost_per_dish}."
  end

  def check_out
    fail 'Please make an order' if order.empty?
    return "Your bill is: £#{total_bill}."
  end

  def submit_order
    restaurant.take_away
  end

  private

  def total_cost_per_dish
    order.map { |dish, quantity| "#{quantity} x #{dish}: £#{'%.2f' % (quantity * Restaurant::MENU[dish])}"}.join(", ")
  end

  def total_bill
    total_bill = 0
    order.each do |dish, quantity|
      price = Restaurant::MENU[dish] * quantity
      total_bill += price
    end
    total_bill
  end
end
