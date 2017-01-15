require_relative 'menu'
require_relative 'order'
require_relative 'send_sms'

class Takeaway

	def initialize(menu=Menu.new, order=Order.new)
		@menu = menu
		@order = order
	end

	def list
		@menu.list
	end

	def order(item, quantity=1)
		quantity.times{@order.items << selected_dishes(item)}
		@order.list_summary(selected_dishes(item), quantity)
		"#{quantity} x #{item}(s) added to basket"
	end

	def order_summary
		@order.summary
	end

	def check_total
		raise 'Incorrect total' if total.to_i != @order.price
		"£#{total}"
	end 

	def complete_order
		send_text("Thank you for your order: £#{total}")
	end

	def send_text(message)
		SMS.new.send_sms(message)
	end

private

	def total
		sprintf('%.2f',@order.price.to_s)
	end

	def selected_dishes(item)
		list.select { |k,v| k == item }
	end

	
end