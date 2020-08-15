

class Order

  attr_accessor :current_order

	def initialize
		@current_order = []
	end



	def add(dish, quant)
    @current_order << { dish.to_sym => quant }
	end


end