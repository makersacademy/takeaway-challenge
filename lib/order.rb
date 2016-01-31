
class Order
	
	def initialize(list:)
		@list = list
	end

	def display_list
		list.display
	end

private

	attr_reader :list

end