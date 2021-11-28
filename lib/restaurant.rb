require_relative "send_sms"
require 'time'

class Restaurant
	attr_reader :pizza_menu
	attr_reader :orders

	def initialize
		@pizza_menu = [
			{bianco: 4.99},
			{diavolo: 5.99},
			{funghi: 5.00},
			{pepperoni: 6.00},
			{vegetarian: 4.99},
			{calabria: 5.00},
			{roma: 6.25}, 
			{fumo: 5.80},
			{formaggi: 5.80}, 
			{regina: 6.80},
			{fiorentina: 5.80},
			{sicilian: 6.00}
		]

		@orders = []
	end

	def add_to_cart(item)
		@pizza_menu.each do |hash|
			if hash.has_key?(item.downcase.to_sym)
				@orders.push(hash)
			end
		end
		"#{item} successfully submitted!"
	end

	def confirm_order
		puts "These are items in your orders cart"
		@orders.each do |hash|
			hash.each_key {|k| puts k}
		end
		puts "type `y` to confirm order"
		while user_input = gets.chomp.downcase
			if user_input == 'y'
				sms = "Thank you! Your order was successfully placed and will be delivered before #{generate_delivery_deadline}!"
				send_confirmation(sms)
				break
			end
		end
		"Ordered Successfully placed @#{Time.new.strftime("%H:%M")}! You will shortly receive an sms confirmation."
	end

	def show_total
		calculate_total
	end

	def check_total(amount)
		orders_sum = 0
		@orders.each do |order_hash|
			order_hash.each_value {|v| orders_sum += v }
		end
		orders_sum == amount
	end

	def generate_delivery_deadline
		time_now = Time.new.strftime("%H:%M")
		one_hour_from_now = (Time.now + 1*60*60).strftime("%H:%M")
	end

	private 

	def send_confirmation(message)
		twilio = TwilioClient.new
		twilio.send_sms(message)
	end

	def duplicate_orders
		@orders.dup
	end

	def calculate_total
		sum = 0
		duplicate_orders.each do |hash|
			hash.each_value do |v|
				sum += v
			end
		end
		sum
	end
end

