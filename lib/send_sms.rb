require 'twilio-ruby'

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441549260018'
to = '+447305057097'

client.messages.create(
	from: from,
	to: to,
	body: "testo besto"
	)
