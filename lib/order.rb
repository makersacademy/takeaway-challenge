require_relative 'menu'

class Order

	include Menu

	attr_reader :basket

	def initialize
		@basket = []
	end

	def create_order
		puts "Please enter an item number:"
		item = STDIN.gets.chomp

		while !item.empty? do
			puts "Please enter quantity:"
			quantity = STDIN.gets.chomp
			add_to_basket(item, quantity)
			view_basket
			puts "Please enter an item number:"
			puts "(To complete order, leave blank and press return)"
			item = STDIN.gets.chomp
		end
	end

	private

		def add_to_basket(item, quantity)
			index = item.to_i - 1
			quantity.to_i.times { @basket << Menu::MENU[index] }
		end

		def view_basket
			puts "Basket contains the following items:"
			puts @basket
		end

end