require_relative 'dish'

class Menu
private
	attr_reader :dishes
public
	def initialize
		@dishes = []
	end

	def add dish
		dishes << dish
		puts "#{dish.get_name} was added to the menu."
	end

	def list_dishes
		dishes
	end

end