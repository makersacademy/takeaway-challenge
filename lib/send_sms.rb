require 'twilio-ruby'

class SMS
	def send_sms(total)
	account_sid = "AC9fe864dc6d88faab1607dccba36ba0b4"
	auth_token = "7b141c"+"928f25cf7b" + "91d021"+"1d058f1975"
	from = "+4"+"41133" + "205"+"746"
	to_num = "+4"+"478"+"012" + "522"+"88" 
	@client = Twilio::REST::Client.new account_sid, auth_token
	@client.account.messages.create({
	        :to => to_num,
	        :from => from,
	        :body => "#{total} and will be delivered before #{deliver_time}"})
	end

private

	def deliver_time
		(Time.now+3600).to_s[11..15]
	end



end
