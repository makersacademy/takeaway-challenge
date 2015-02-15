require 'twilio-ruby'

class Messenger

	def initialize
  	account_sid = 'AC6aac4805601dc47994c43123f7fba22f' 
  	auth_token = '8fb08bde52b4822a84e3c78bcc023c8a' 
  	@client = Twilio::REST::Client.new account_sid, auth_token
	end

	def confirmation(time)
  	message = @client.account.sms.messages.create(
  	:body => "Thank you for your Order! it will be with you before #{time}",
  	:to => "+4407481233972",
  	:from => "+441206700273"  )
	end


	def time
  	Time.now + 60
 	end

end