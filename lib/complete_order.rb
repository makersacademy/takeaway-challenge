require_relative 'customer_order'

class CompleteOrder

	def initialize(my_order, messenger=Message)
		@mesenger = messenger.new
		@my_order = my_order
	end

	def total_cost		 
		cost
		@sum
	end

	def completed
		fail "You have nothing in your basket." if @my_order.empty?
		
	end

	private

	def cost
		@sum = 0
		[@my_order.values,item_list].transpose.map{|x| x.reduce :*}.each {|k| @sum+=k}
	end

end