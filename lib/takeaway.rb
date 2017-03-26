# Takeaway receives menus, takes order and calculates checkout
require_relative 'menu'
require 'twilio-ruby'

class Takeaway

  ORDER_TOTAL = @total

	attr_reader :import_menu, :view_menu, :orders, :basket, :dish, :amount, :price, :checkout, :amount_total, :price_total, :total

	def initialize
    @view_menu
    @orders = []
    @dish
    @amount
	end

	def view_menu
		@import_menu = Menu.new
		menu = self.import_menu.dishes
	end

	def place_order(dish, amount)
		if view_menu.key?(dish)
		  puts "#{amount}x #{dish} added to basket" 
		  @dish = dish
		  @amount = amount
		  @price = view_menu[dish]
		  self.add_to_orders(dish, price, amount)
		end
	end

	def add_to_orders(dish, price, amount)
		@orders << {dish_name: dish, price: price , amount: amount }
	end

	def checkout
    @amount_total = self.orders.inject(0) {|sum, hash| sum + hash[:amount]}
		@price_total = self.orders.inject(0) {|sum, hash| sum + hash[:price]}
		@total = (self.amount_total) * (self.price_total)
		puts "Your total is £#{self.total}"
		@orders
	end

  def complete_order
  	send_text("Thank you for your order: £#{self.total}")
  end

  def send_text(complete_order)
  	Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    .messages.create(
    	from: ENV['TWILIO_PHONE'],
    	to: ENV['TWILIO_DESTINATION_PHONE'],
    	body: complete_order
    	)
  end
end