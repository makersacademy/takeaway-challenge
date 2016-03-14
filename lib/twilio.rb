require 'dotenv'
require 'twilio-ruby'
Dotenv.load

class Twilio
  account_sid = ENV['ACCOUNTSID']
  auth_token = ENV['AUTHTOKEN']
  @to_number = ENV['PERSONAL']
  @from_number = ENV['TWILIO']

  @client = Twilio::REST::Client.new account_sid, auth_token

  def text message
    @client.messages.create(
      to: @to_number,
      from: @from_number,
      body: message
    )
  end
end
