
require_relative 'order'
require_relative 'sms'
require 'rubygems' 
require 'twilio-ruby' 
class Takeaway

	def initialize(menu:, config:, order:, sms: nil)
		@menu = menu
		@order = order || Order.new(menu)
		@sms = sms || SMS.new(config)
	end

	def print_menu
		menu.show
	end

	def select_order(dishes)
		add_dishes(dishes)
		sms.deliver
		order.order_total
	end

	def confirm_order 
		message
	end

		private

		attr_reader :menu, :order, :sms

		def add_dishes(dishes)
			dishes.each do |dish, number|
			order.add(dish, number)
			end
		end

		def message
			account_sid = "AC328ae31fa3ea52b0e959f91cb768852b"
			auth_token = "26b09a22f0ff29abee49033df09f963f"
			client = Twilio::REST::Client.new account_sid, auth_token
 
			from = "+441494372428" 
 
			friends = {
			"+447824388248" => "client"
						}
			friends.each do |key, value|
			client.account.messages.create(
 		  	:from => from,
  			:to => key,
   			:body => "Thank you! Your order was placed and will be delivered before #{(Time.now + 60 * 60).strftime("%H:%M")}")
		end
		
end