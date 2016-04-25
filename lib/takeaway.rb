require 'sms'
require 'order'

class Takeaway

	def initialize(menu:, config:, order:Order.new(menu), sms:SMS.new(config))
		@menu = menu
		@order = order
		@sms = sms
	end
	def display_menu
		menu.display
	end

	def order_dishes(number_dishes)
		order.log(number_dishes)
		sms.send
		order.total
	end

	private

	attr_reader :menu, :order, :sms
end