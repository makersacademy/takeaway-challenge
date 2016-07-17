require_relative 'menu'
require 'twilio-ruby'
require 'yaml'

class Order
private
	attr_reader :menu, :basket
public
	
	# rescue_from StandardError do |exception|
	# 	trigger_sms_alerts(exception)
	# end

	def initialize menu:
		@menu = menu
		@basket = Hash.new(0)
	end

	def read_menu
		menu.list_dishes
	end

	def select_dish dish_name, quantity
		dish = menu.list_dishes.find{ |dish| dish.get_name == dish_name }
		basket[dish] += quantity
		puts "You ordered #{quantity}x #{dish_name}"
	end

	def basket_summary
		puts "The total cost of your basket is £#{check_total_cost}:\n"
		basket
	end

	def check_total_cost
		total_cost = 0
		basket.each { |dish, quantity| total_cost += (dish.get_price*quantity) }
		total_cost
	end

	def place_order payment
		fail "Payment does not match total cost" if payment != check_total_cost
		@confirmation_message = "Your order has been placed! Your meal will be delivered by #{Time.new + 60*60}."
		@customer_list = YAML.load_file('config/customers.yml')
		send_message(@customer_list.first["phone_number"], @confirmation_message)
				"Your order has been placed!"

	end

	def send_message phone_number, confirmation_message
		@twilio_number = +441609810033
		@client = Twilio::REST::Client.new 'AC80f131091e883d5b3b3c588811ebbff0', 'bd248a98f20e66792b0537022cf061cd'

		message = @client.account.messages.create(
			:from => @twilio_number,
			:to => phone_number,
			:body => confirmation_message
			)
		puts message.to 
	end
end





















