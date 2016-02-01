# deals with menus and selection

class Menu

	attr_reader :dishes, :prices

	def initialize
		@dishes = Hash.new
		@prices = prices
	end

	def list_dishes
		@dishes
	end

	def prices
		@prices
	end
end