class OrderProcessor

	def initialize notifiable, calculable
		@notifiable = notifiable
		@calculable = calculable
	end

	def process order 
		check order
	end

	def notify_order
		notifiable.send
	end

	private

	attr_reader :notifiable, :calculable

	def order_verificator? order
		order[ sum ] == calculator( order )
	end

	def calculator order
		calculable.call order
	end

	def check order
		if order_verificator 
			
		else
			raise_exception
		end
	end

	def raise_exception
		raise "The total is not correct"
	end

end