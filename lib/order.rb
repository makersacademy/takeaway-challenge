
require 'date'
require_relative 'twilio'

class Order 
		attr_reader :cart, :cart_total, :message

		def initialize
				@cart = []
		end

		def total
				@cart_total = []
				@cart.each { |item| @cart_total << item.price }
				@cart_total.sum
		end

		def receipt
			# should return a list of all the items with price and finally the total
				@cart.each { |item| puts "#{item.name}, £#{item.price}" }
				puts "Your Total is: £#{total}"
		end

		def confirm_order
				@cart.clear
				# somehow call twilio to send a message
				puts confirmation_message	
		end

		def confirmation_message
				return "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}"
			end
end

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given 
# matches the sum of the various dishes in my order

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as 
# "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
