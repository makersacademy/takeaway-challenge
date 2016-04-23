class Menu
	attr_reader :dishes
	def initialize(dishes)
		@dishes = dishes
	end
	def display
		dishes.map{|food,value| "#{food.to_s.capitalize} £%0.2f" % [value]}.join("\n")
	end

end