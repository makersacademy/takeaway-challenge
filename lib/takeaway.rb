# deals with orders + cost
require 'order'
require 'sms'

class Takeaway

	def initialize(menu:, config:, order: nil, sms: nil) #dependency injection - 'other class is injected into this class to enable menu class methods to be accessed'
		@menu = menu
		@order = order || Order.new(menu)
		@sms = sms || SMS.new(config)
	end

	def print_menu
		menu.print
	end

	def place_order(dishes)
		add_dishes(dishes)
		sms.deliver
		order.total
	end

	private

	attr_reader :menu, :order, :sms  ## ?? ## why are these private?

	def add_dishes(dishes)
				dishes.each do |dish, quantity|
		order.add(dish, quantity)
		end
	end
end