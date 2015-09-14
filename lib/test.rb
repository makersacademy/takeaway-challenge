require 'twilio-ruby'

account_sid = 'ACf8addc5058d1be8f246fd75fa4ce9013'
auth_token = 'bb5aa7da4e982b37aac058a31d962549'

@client = Twilio::REST::Client.new account_sid, auth_token

from = '+441908410626'

friends = {'+447514951807'=>"Alex Person"}

# friends.each do |key, value|
# 	message = 

	@client.account.messages.create(
			from: '+441908410626',
			to: '+447514951807',
			body: "Yo dudeness mclongdong, WERGLE BERGLE!"
		)
	puts "Sent message to #{value}"
