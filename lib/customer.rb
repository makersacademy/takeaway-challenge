class Customer 

	def initialize order_handler
		@order_handler = order_handler
	end

	def get_menu
		order_handler.get_menu
	end

	private

	attr_reader :order_handler

end