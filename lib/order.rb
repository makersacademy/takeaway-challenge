# require 'send_sms'
class Order

	def initialize
		# @ordered_dish_list = []
		@order_line_list = []
	end

	def add_dish(dish,qty)
		order_line = Order_line.new(dish,qty)
		@order_line_list << order_line
		# @ordered_dish_list << dish
	end

	def ordered_dish_count
		# @ordered_dish_list.count
		@order_line_list.count
	end
	# def order_dish_list
	# end

	def order_line_list
		@order_line_list
	end


	def order_total
		total = 0
		@order_line_list.each {|order_line| 
			total = total + order_line.dish.price * order_line.qty
		}
		p "=========="
		p total
	end




end