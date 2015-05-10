require 'menu'

class Order
  attr_accessor :order_list

  def initialize
  	@order_list = []
  	@order_hash = {}
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
    order_list.each do |n,i|
      @order_hash << n if list.include(n)
    end
  end
end