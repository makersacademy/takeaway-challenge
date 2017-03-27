# Takeaway receives menus, takes order and calculates checkout
require_relative 'menu'
require 'twilio-ruby'

class Takeaway

  ORDER_TOTAL = @total

	attr_reader :import_menu, :view_menu, :orders, :basket, :dish, :amount, :price, :checkout, :total

	def initialize
    @view_menu
    @orders = []
    @dish
    @amount
    @total
	end

	def view_menu
		@import_menu = Menu.new
		menu = import_menu.dishes
	end

	def place_order(dish, amount)
		if view_menu.key?(dish)
		  puts "#{amount}x #{dish} added to basket" 
		  @dish = dish
		  @amount = amount
		  @price = view_menu[dish]
		  add_to_orders(dish, price, amount)
		end
	end

	def add_to_orders(dish, price, amount)
		@orders << {dish_name: dish, price: price , amount: amount }
	end

	def checkout
    amount_total = orders.inject(0) {|sum, hash| sum + hash[:amount]}
		price_total = orders.inject(0) {|sum, hash| sum + hash[:price]}
		@total = (amount_total) * (price_total)
		puts "Your total is £#{total}"
	end

	def total
		@total
	end

  def complete_order
  	send_text("Thank you for your order: £#{total}")
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