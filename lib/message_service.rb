require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class MessageService

  def initialize
    @account_sid = ENV['ACCOUNT_SID']
    @auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send_sms(body)
    @client.api.account.messages.create(
      from: ENV['TWILIO_FROM'],
      to: ENV['TWILIO_TO'],
      body: body
    )
  end

end
