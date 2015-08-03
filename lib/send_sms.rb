require 'rubygems'
require 'twilio-ruby'
 
class SMS

	def self.send
		# Get your Account Sid and Auth Token from twilio.com/user/account
		account_sid = 'AC41c8de9f2819bb775e64704ab2e621c5'
		auth_token = '5b7134385d4726cfbcc2e4ba4f01e49a'
		@client = Twilio::REST::Client.new account_sid, auth_token
		 
		 t = Time.now
		 hour = t.hour + 1
		 minute = t.min

		message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{hour}:#{minute}", 
		    :to => "+447429457782",     # Replace with your phone number
		    :from => "+441753254307")   # Replace with your Twilio number
		puts message.sid
	end
end