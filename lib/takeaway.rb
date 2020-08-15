require_relative 'menu'
require_relative 'order'

class Takeaway

	attr_reader :menu
	attr_reader :avail_dishes
	attr_reader :order


	def initialize
		@menu = Menu.new
		@order = nil
	end

  def place_order
    @order = Order.new
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