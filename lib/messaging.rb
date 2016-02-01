require 'dotenv'
require 'twilio-ruby'
require './lib/takeaway'

class Message

	def text_message

	Dotenv.load

	accountSID = ENV['TWILIO_ACCOUNT_SID']
    authToken = ENV['TWILIO_AUTH_TOKEN']
	from_phone = ENV['TWILIO_PHONE']

	receiver = ENV['RECEIVER']

	message = "Thank you! Your order was placed and will be delivered before #{one_hours_time}"

	@client = Twilio::REST::Client.new accountSID, authToken

	@client.account.messages.create(
	:from => from_phone,
	:to  => receiver,
	:body => message

	)
	
	message
	end

end



