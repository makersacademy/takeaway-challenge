class OrderHandler

	attr_reader :menu

	def initialize menu, order_processor
		@menu = menu
	end

	def show_menu
		menu
	end

	def process_order order 
		order_processor.process order 
	end 

end