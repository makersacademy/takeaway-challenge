require_relative 'menu.rb'

class Select

	attr_reader :order, :menu

	def initialize
		@menu = Menu.new
		@menu = @menu.menu
		@order = {}
	end
	def see
		@menu
	end
    
    def pick(dish , quantity=1)
    	#@menu[dish]
    	raise 'this dish is not in the menu' unless @menu.include? dish
    	@order.merge!({dish => quantity})
    end
    def bill
    	@order.inject(0) {|key,value| puts value}
    end


end