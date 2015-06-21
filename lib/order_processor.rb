class OrderProcessor

	def initialize notifiable, calculable
		@notifiable = notifiable
		@calculable = calculable
	end

	def process order 
		check order
	end

	private

	attr_reader :notifiable, :calculable

	def valid_order? order
		order[ sum ] == calculator( order )
	end

	def calculator order
		calculable.call order
	end

	def check order
		if valid_order 
			notifiable.call
		else
			raise_exception
		end
	end

	def raise_exception
		raise "The total is not correct"
	end

end