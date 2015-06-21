require_relative 'notifier'

class OrderProcessor

	def initialize validator: Validator
		@validator = validator
	end

	def process order
		
		*self.dishes_with_price, self.customer_price = order
		binding.pry
		validate
	end

	private
	
	def validate 

		if validator.call( customer_price[1].to_i, company_price )
			Notifier.call
		else
			raise_exception
		end
	end
	
	attr_accessor :dishes_with_price, :validator, :customer_price


	def company_price
		dishes_with_price.reduce( 0 ) do |acum, ( dish, price )|
			price.to_i + acum 
		end
	end

	def raise_exception
		raise "InvalidPriceError" 
	end

end

	OrderProcessor::Validator = -> ( one_price, another_price  ) do
		one_price == another_price
	end 
