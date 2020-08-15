require_relative 'menu'

class Order

	attr_reader :menu


	def initialize
		@total = 0
		@menu = Menu.new
	end

  def start

  end


  def finish

  end

  def print_menu
    @menu.dishes
  end

end