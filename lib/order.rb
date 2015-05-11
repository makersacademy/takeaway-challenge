
require_relative 'checkout'

class Order
  attr_accessor :order_list, :menu_list

  include Checkout

  def initialize
  	@menu_list = {"Bottle of Water" => 3.08, "Disney Themed Napkins (x5)" => 50, "Carbonara" => 0.4, "Ice cream" => 0.48, "Happiness" => 0}
  	@order_list = []
  end

  def print_menu
  	menu_list.each do |dish_key, dish_price|
      "#{dish_key}: #{£dish_price}"
  	end
  end

  def add_dish(quantity, dish_key)
  	quantity.times do
  	  order_list << menu_list.select do |k|
  	  	k == dish_key
  	  end
  	end
  end

  def view_order
  	order_list
  end
end

#use inject method to add up all dish prices?