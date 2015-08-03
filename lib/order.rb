require_relative 'menu'
require_relative 'send_sms'

class Order

	attr_reader :order_list, :menu_list, :total

	def initialize
		@order_list = []
		@menu_list = {
			"Chicken Fry Rice" => 6.59,
		    "Curry Beef Rice" => 5.59,
		    "Sweet King Prawns" => 7.59,
			"Mushroom Soup" => 4.59,
			"Hot & Sour Soup" => 4.59
		}
		@total = 0
		
	end

	def place_order(dish_number, quantity)
		order_list << [menu_list.keys[(dish_number-1)], menu_list.values[(dish_number-1)], 
		quantity, quantity * menu_list.values[dish_number]]
	end

	def order_table
		pay_total
		table = Terminal::Table.new :title => "Order Table", 
		:headings => ['Dish Name', 'Price(£)', 'Quantity', 'Sub-total(£)'], :rows => order_list
		table.align_column(1,:center)
		table.align_column(2,:center)
		table.align_column(3,:center)
		puts table
	end

	def pay(amount=0.0)
		fail "Wrong amount paid" unless order_list[(order_list.count-1)][-1] == amount 
		"Right amount paid"
	end
	
	private

	def pay_total
		i = 0 
		order_list.count.times do 
			@total += order_list[i][-1] 
		end
		order_list << ["Total amount: ","","","#{total.to_s}"]
	end
end