require_relative 'takeaway'

class Customer

  attr_reader :takeaway, :basket

  def initialize(takeaway_klass)
    @takeaway = takeaway_klass.new
    @basket = Hash.new(0)
  end

  def self.view_menu(restaurant)
    restaurant.menu
  end

  def select_dish(dish, quantity)
    raise 'Please select a dish from the menu' unless dish_exists?(dish)
    @basket[dish] += quantity
    "#{quantity}x #{dish}(s) added to your basket"
  end

  def order_total
    @basket.map{|k,v| @takeaway.menu[k] * v }.inject(:+)
  end

  def place_order
    raise 'Your basket is empty. Please select a dish' if basket_empty?
    @takeaway.complete_order(self.order_total)
  end

  private

  def dish_exists?(dish)
    self.takeaway.menu.has_key?(dish)
  end

  def basket_empty?
    @basket.empty?
  end

end
