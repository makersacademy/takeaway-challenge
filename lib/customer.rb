require_relative 'menu'

class Customer 
	include Menu

	attr_reader :selected_dishes, :total

	def initialize
		@selected_dishes = {}
		@total = 0
	end 

	def view_menu
		self.dishes
	end 

	def select_dish (dish)
		raise 'This dish is not on the menu' unless self.dishes.include? dish
		selected_dishes[dish] = self.dishes[dish]
		'Your dish has been added to the total'
	end 

	def total_price
		selected_dishes.each_value{|price| @total += price} if @total == 0
   	@total
	end

	def payment_requested amount
		raise 'Payment does not match total' if (amount != total)
	end 

end 