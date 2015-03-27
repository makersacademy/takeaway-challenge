require 'rubygems'
require 'twilio-ruby'

class SMS
 
 	def time
		time = Time.new
		hour = time.hour + 1
		min = time.min
		return "#{hour}: #{min}"
	end

	 def send_sms
	# Get your Account Sid and Auth Token from twilio.com/user/account
	account_sid = 'AC700862d70072900720bd27ca88da1963'
	auth_token = '78c1646f25e6029d1dbde0a1ccdbe268'
	@client = Twilio::REST::Client.new account_sid, auth_token
	 
	message = @client.account.messages.create(:body => "you sick cunt the time is #{self.time}",
	    :to => "+447587846243",     # Replace with your phone number
	    :from => "+441158240706")   # Replace with your Twilio number
	puts message.sid

	end

end