require_relative 'menu'
require_relative 'checkout'

class Order
  attr_accessor :order_list

  include Checkout

  def initialize
  	@order_list = []
  end

  def add_dish(quantity, dish_key)
  	quantity.times do
  	  order_list << dish_key
  	end
  end

  def view_order
  	order_list
  end
end

#use inject method to add up all dish prices?