class Takeaway

	attr_reader :orders, :menu

	def initialize(menu)
		@orders = Array.new
		@menu = menu
	end

	def place(order)
		@orders << order.food
		send_text(order.phone_number)
	end

	def send_text(phone_number)
		
	end
end
