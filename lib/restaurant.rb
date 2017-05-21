require 'menu'
require 'order'
class Restaurant

	attr_reader :menu

  def initialize(menu:)
  	@menu = menu

   	

  end

  def print_menu
  	menu.print 
  end

end


# p r= Restaurant.new
# p r.menu
# p r.basket


