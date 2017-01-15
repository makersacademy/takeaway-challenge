require 'twilio-ruby'

class SMS
	def send_sms(total)
	account_sid = "AC9fe864dc6d88faab1607dccba36ba0b4"
	int_1 = "91d0211d058f1975"
	int_2 = "7b141c928f25cf7b"
	auth_token = "#{int_2}" + "#{int_1}"
	from = "+441133205746" # Your Twilio number
	str_1 = "52288"
	str_2 = "+4478012"
	to_num = "#{str_2}" + "#{str_1}"
	deliver_time = (Time.now+3600).to_s[11..15]


	@client = Twilio::REST::Client.new account_sid, auth_token 

	@client.account.messages.create({
	        :to => to_num,
	        :from => from,
	        :body => "Thank you! Your order was placed, total #{total} and will be delivered before #{deliver_time}" })
	end

end