
require_relative 'order'
#require 'rubygems' 
#require 'twilio-ruby' rspec breaks when I include these.
class Takeaway

	def initialize(menu:, order:)
		@menu = menu
		@order = order || Order.new
	end

	def print_menu
		menu.show
	end

	def select_order(dishes)
		dishes.each do |dish, number|
			order.add(dish, number)
		end
		order.order_total
	end

	def confirm_order #should be something like this however I couldn't get it working
		#account_sid = "AC328ae31fa3ea52b0e959f91cb768852b"
   		#auth_token = "26b09a22f0ff29abee49033df09f963f"
   		#client = Twilio::REST::Client.new account_sid, auth_token

   		#from = "+441494372428"

   		#client.account.messages.create(:from => from,:to => "+447824388248", :body => "Order confirmed!")
   		message
	end

		private

		attr_reader :menu, :order, :textmessage

		def message
		"delivery message"
		end
end