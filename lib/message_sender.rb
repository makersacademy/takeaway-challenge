class MessageSender

	attr_accessor :sms_message
	attr_reader :order_time, :delivery_time

	def set_order_time(time)
		@order_time = time.to_s.slice(11,5)
	end

	def order_time
		@order_time
	end

	def delivery_time
		array = order_time.split(":")	
		array[0] == "23" ? array[0] = "00" : array[0] = array[0].next 
		array.insert(1,":")
		array.join
	end

	def sms_message
		@sms_message = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
	end
		
	def send_message
		require 'rubygems'
		require 'twilio-ruby'
		# Get your Account Sid and Auth Token from twilio.com/user/account
		account_sid = 'AC224c736fce467ca8cf9b8b3bfa73a034'
		auth_token = 'b4c6b04027185a9860c8e9b429038012'
		@client = Twilio::REST::Client.new account_sid, auth_token
		 
		message = @client.account.messages.create(:body => sms_message,
		    :to => "+447738567183",     # Replace with your phone number
		    :from => "+441315102998")   # Replace with your Twilio number
		message.sid.length
	end

end