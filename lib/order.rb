require_relative 'dish'

class Order

	attr_reader :current_order

	def initialize
		@current_order = []
	end

	def update_order(item)
		@current_order << item
	end

	def confirm_order
		total_price = @current_order.inject(0) {|sum,item| sum += item.price }.round(2)
		puts "Is the following order correct? y/n"
		@current_order.each { |item| puts "#{item.name} #{item.price}" }
		puts "£#{total_price}"
		input = STDIN.gets.chomp
		input.downcase == "y" ? send_text : input.downcase == "n" ? puts("Sorry. Please review your order.") : puts("please enter y or n")
	end

	def send_text
		account_sid = "AC37b7fb5464abe5ce0c6a32c92aaf46d4"
		auth_token = "0ec9a2d40f4b090496f74e7bbb4396f4"

		client = Twilio::REST::Client.new(account_sid, auth_token)
		client.account.messages.create({
			:from => +441143032672,
			:to => +447891139631,
			:body => "Your food will arrive at #{Time.new.hour+1}:#{Time.new.min}",
		})
		puts "message sent successfully"
	end
end