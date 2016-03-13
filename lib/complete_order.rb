require_relative 'customer_order'
#require_relative 'message'

class CompleteOrder

	def initialize(customer_order, messenger=Message)
		@messenger = messenger.new
		@customer_order = customer_order
		@checkout = customer_order.my_order
	end

	def total_cost		 
		cost
		@sum
	end

	def completed
		fail "You have nothing in your basket." if @checkout.empty?
		@messenger.send_sms(@customer_order.customer.number, message)		
	end

	private

	def cost
		@sum = 0
		[@checkout.values,item_list].transpose.map{|x| x.reduce :*}.each {|k| @sum+=k}
	end

	def item_list				
 		my_hash = []		
 		@checkout.keys.each {|value| value.each {|k,v| my_hash << v}}		
 		my_hash	
 	end

 	def message
 		"Your order has been successful."
 	end

end