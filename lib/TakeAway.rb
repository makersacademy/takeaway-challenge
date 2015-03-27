class Takeaway

	def process_order(order, payment)
		if order.total_amount < payment
			raise 'wrong payment' 
		else
			"thanks"
		end
	end
end