require "./lib/menu.rb"

class Order

	attr_accessor :menu, :basket, :total

	def initialize(total = 0)
		@menu = Menu.new
		@basket = []
		@total = total
	end

	def add_items(item, amount = 1)
		amount.times do
			@basket << @menu.menu[item - 1]
		end # <--- Tried with a string but I was getting an error, so went for an integer ~
	end

	def view_order
		@basket.each_with_index do |item, index|
			puts "#{index + 1}. #{item[:dish]} : £#{item[:price]}"
		end
	end
end