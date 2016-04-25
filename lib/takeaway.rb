require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class TakeAway

	attr_reader :menu

	def initialize(menu = Menu.new, order = Order.new, sms_provider = SMS.new)
		@menu = menu
		@order = order
		@sms_provider = sms_provider
	end

	def read_menu
		@menu.print
	end

	def add_order(dish_number, quantity)
		dish = menu.dishes[dish_number.to_s]
		@order.add(dish, quantity)
	end

	def order_summary
		@order.summary
	end

	def confirm_order(total)
		fail "The total amout you have entered is incorrect, please try again." if !verify(total)
		@sms_provider.send_message
		puts 'Confimation message has been sent!'
	end

	private

		def format_user_total(total)
			("%.2f" % total).to_s.gsub(".",'').to_i
		end

		def verify(total)
			format_user_total(total).to_i == @order.total.to_i
		end

end