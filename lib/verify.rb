require './lib/order.rb'
require 'twilio-ruby'

class Verify

attr_reader :completed_order



def send_message(text_message)

  account_sid = 'AC4de8dd33e2d6ee76b3faf33cb63def35'
  auth_token = '53e0790c0c05a41fdfb74f288bcb9476'

  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create(
  	from: '+441274451660',
  	to: '+447960022719',
  	body: text_message,
  )

end


end
