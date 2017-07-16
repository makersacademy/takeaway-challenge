require 'dotenv'
require 'twilio-ruby'

class Messenger

  def initialize
    @account_sid = ENV['ACCOUNT_SID'] # Account SID from www.twilio.com/console
    @auth_token = ENV['AUTH_TOKEN'] # Auth Token from www.twilio.com/console
    @from = ENV['FROM'] # Your Twilio number
    @to = ENV['TO'] # Your phone number
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_message(text)
    @client.messages.create(body: text, to: @to, from: @from).sid
    "Success"
  end
end
