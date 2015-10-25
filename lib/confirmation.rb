class Confirmation

	attr_reader :checkout, :total

	def initialize(checkout)
		@checkout = checkout
		@total = 0
	end
	
	def user_cost (user_total)
		total_cost
		raise "The totals don't match, ours: £#{total} yours: £#{user_total}!" if total != user_total
		"Your order: #{checkout}. Comes to a total of £#{@total}. Would you like to proceed?"
	end

	def total_cost
		checkout.each { |key,value| @total += value[0] * value[1]}
	end

end