require 'rubygems'
require 'twilio-ruby'

class Send_sms

	# def client
		account_sid = ""
		auth_token = ""
		client = Twilio::REST::Client.new account_sid, auth_token
		 
		from = "+" # Your Twilio number

		friends = {
		"" => "Rizwan Ali"}

		
		friends.each do |key, value|
		  client.account.messages.create(
		    :from => from,
		    :to => key,
		    :body => "Hey #{value}, Monkey party at 6PM. Bring Bananas!"
			  )
		  
		  puts "Sent message to #{value}"
		end
	# end

	# def delivery_time
	# 	time = Time.new
	# 	time = time.hour.to_s + ":" + time.min.to_s
	# 	puts time
	# end

	# def print_message
	# 	puts delivery_time
	# end

	# print_message

end