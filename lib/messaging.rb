require 'twilio-ruby'
require './lib/takeaway'

class Message

	def text_message

	accountSID = 'AC057ecd456cd3493339ba8c2de10350a0'
	authToken= '2e8be36624c5fda0f464b1ae086c2770'

	@client = Twilio::REST::Client.new accountSID, authToken

	from = '447481346274'

	friends = { '447970362728' => 'Russell Vaughan'}

	message = "Thank you! Your order was placed and will be delivered before #{one_hours_time}"

	friends.each do |key,value|

	message = @client.account.messages.create(
	:from => from,
	:to  => key,
	:body => message)
	
	end
	message
	end

end



