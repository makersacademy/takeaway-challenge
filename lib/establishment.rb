class Establishment

	def initialize(menu,checker=Checker.new,texter=Texter.new)
		@menu = menu
		@checker = checker
		@texter = texter
	end

	def view_menu
		@menu.list
	end

	def place_order(total:,order:,time:Time.now)
		if @checker.pass?(total,order,view_menu)
			@texter.send_confirmation(time)
		end
	end

	def check_orders_received
		@texter.check_for_orders(self)
	end

end