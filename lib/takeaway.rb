require_relative 'menu'
require 'order'

class Takeaway

	attr_reader :menu
	attr_reader :avail_dishes


	def initialize
		@menu = Menu.new
		@order = Order.new
	end

  def start_order(dishes)

  end


  def finish_order

  end

  def print_menu
  	@menu.avail_dishes
    #@menu.dishes.each do |dish, price|
    	#{}"#{dish.to_s}: #{price}"
    #end
  end

end