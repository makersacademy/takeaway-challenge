class Menu
	attr_reader :dishes
	def initialize(dishes)
		@dishes = dishes
	end 

	def print
		@dishes.map do |name, price|
			"#{name} £#{price}"
		end.join(", ")
	end

		def exist?(dish)
			!!dishes[dish]
		end 
end