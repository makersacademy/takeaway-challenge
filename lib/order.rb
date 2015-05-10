require 'menu'

class Order
  attr_accessor :order_list

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

  def order_price
  	order_hash = {}
    order_list.each do |dish_key,i|
      order_hash << dish_key if list.include(dish_key)
    end
  end
end