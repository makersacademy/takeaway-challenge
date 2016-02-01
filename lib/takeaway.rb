
class Takeaway
	
	def initialize(list:, order: nil)
		@list = list
		@order = order || Order.new
	end

	def display_list
		list.display
	end


	def place_order(dishes)
    dishes.each do |dish, quantity|
    order.add(dish, quantity)
  	end
  order.total
	end

	private

	attr_reader :list, :order

end