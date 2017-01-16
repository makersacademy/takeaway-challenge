require 'twilio-ruby'

class SMS

	def initialise
	account_sid = "AC9fe86"+"4dc6d88faab1607dccba36ba0b4"
	auth_token = "7b141c"+"928f25cf7b" + "91d021"+"1d058f1975"
	from = "+4"+"41133" + "205"+"746"
	to_num = "+4"+"478"+"012" + "522"+"88" 
	end

	def send_sms(total)
	
	@client = Twilio::REST::Client.new account_sid, auth_token
	@client.account.messages.create({
	        :to => to_num,
	        :from => from,
	        :body => "Thank you! Your order was placed, total #{total} and will be delivered before #{deliver_time}"})
	end

private

	def deliver_time
		(Time.now+3600).to_s[11..15]
	end



end
