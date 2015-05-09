require_relative 'restaurant'
class Customer

  attr_accessor :restaurant

  def initialize
    @restaurant = Restaurant.new
  end

  def view_menu
    restaurant.menu
  end

  def select_dishes dish, quantity
    quantity.times do
      restaurant.order << restaurant.menu.select {|x,y| x == dish}
    end
  end

  def check_total_amount
    total_amount = restaurant.order.map{|item| item.values}.flatten.inject{|sum,x| sum + x }
    return total_amount
  end
end