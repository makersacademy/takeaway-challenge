require_relative 'menu'
require_relative 'takeaway'
require_relative 'order'
class Menu

	attr_accessor :list

	def initialize
		@list = {}
	end

	def add_item(index, item, price)
		@list[index] = {item => price}
	end

	def view_menu
		@list.each do |index,item|
			item.each do |dish, price|
				puts "#{index}....#{dish} -  £#{price}"
			end
		end
	end


end
