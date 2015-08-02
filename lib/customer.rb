require './lib/menu'

class Customer

	attr_accessor :meal

	def initialize 
		#do a DI
		@meal = Menu.new
	end

	def details_total 
		puts @meal.selection
		puts total
	end

	def total 
		@meal.selection.inject(0) {|result,element| result + element[1] * element[2]}
	end

end