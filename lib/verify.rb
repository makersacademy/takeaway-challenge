require './lib/order.rb'
require 'twilio-ruby'

require 'dotenv'
Dotenv.load

class Verify

attr_reader :completed_order



def send_message(text_message)

  account_sid = ENV['ACCOUNT_SID']
  auth_token = ENV['AUTH_TOKEN']
  phone_number = ENV['PHONE_NUMBER']

  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create(
  	from: '+441274451660',
  	to: phone_number,
  	body: text_message,
  )

end


end
