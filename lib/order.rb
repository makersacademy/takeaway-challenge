require 'menu'

class Order
  attr_accessor :order_list, :menu_list

  def initialize
  	@order_list = []
  	@menu_list = Menu.new
  end
  def add_dish(quantity, dish_key)
  	quantity.times do
  	  order_list << dish_key
  	end
  end

  def view_order
  	order_list
  end

  def order_price
  	# OKAY - what do we want?
  	# 	To make a ORDER_HASH with key names and values taken
  	# 	from hash provided in menu class maybe...?
  	#   only way I can think of that will let me get the total price.
  	#   Want to go back and change print_menu method now
  	order_hash = {}





    order_list.map(&:v).inject do |sum, x|
      sum + x
    end
  end
end

#use inject method to add up all dish prices?