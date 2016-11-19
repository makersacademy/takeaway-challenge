require_relative 'menu'

class Order

	include Menu

	attr_reader :basket

	def initialize
		@basket = []
	end

	def create_order
		get_item
		while !@item.empty? do
			get_quantity
			add_to_basket(@item, @quantity)
			view_basket
			get_item
		end
		puts "Thank you. Please proceed to payment."
		puts "Your total is:"
		order_total
	end

	private

		def add_to_basket(item, quantity)
			index = @item.to_i - 1
			@quantity.to_i.times { @basket << Menu::MENU[index] }
		end

		def view_basket
			puts "Basket contains the following items:"
			puts @basket
		end

		def get_item
			puts "Please enter an item number:"
			puts "(To complete order, leave blank and press return)"
			@item = $stdin.gets.chomp
		end

		def get_quantity
			puts "Please enter quantity:"
			@quantity = $stdin.gets.chomp
		end

		def order_total
			total = 0
			@basket.each { | item |
				cost = item[:cost].sub(/£/, '').to_f
				total += cost
			}
			"£#{total}"
		end

end