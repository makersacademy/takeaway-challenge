require 'twilio-ruby'

module Sms

	def time
		time_plus_one_hour = Time.now + 1*60*60
		time_plus_one_hour.strftime('%H:%M')
	end

	def send_text
 
# put your own credentials here 
account_sid = 'AC0e83fe083fb55a4766f6753c95ce731b' 
auth_token = '13be63ad78d57375f9704d9d9adb0d81' 
 
# set up a client to talk to the Twilio REST API 
@client = Twilio::REST::Client.new account_sid, auth_token 
 
@client.account.messages.create({
	:from => '+441233800288', 
	:to => '+447759190557', 
	:body => "Thanks for you order at Awesome Takeaway! Your oder will be with you by #{time}",  
		account_sid = 'ACc36ee9ccdc509580db7161dd88669a8e'
		auth_token = '861bfe0a7073153f9f735baf1145adf1'
		@client = Twilio::REST::Client.new account_sid, auth_token
	end
end
