require_relative 'basket'
require_relative 'menu' #delete this
require_relative 'restaurant' #and this
require_relative 'messager'

class Order

attr_reader :restaurant_class, :basket

  def initialize(restaurant_class = Restaurant.new)
    @restaurant_class = restaurant_class
    @basket = Hash.new(0)
  end

  def add(dish, quantity = 1)
    fail 'Dish not available' unless restaurant_class.display_menu.include?(dish)
    @basket[dish] += quantity
    puts "#{dish} x#{quantity} added to basket"
  end

  def summary
    @basket.reduce { |sum, dish| sum + dish }
  end

  def to_pay

  end

  def checkout
    fail 'Incorrect price. Order cancelled' unless correct_price?

  end

  private

  def correct_price?(price)
    to_pay == price
  end
end