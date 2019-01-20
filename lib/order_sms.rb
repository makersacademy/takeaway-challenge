require 'dotenv/load'
require 'twilio-ruby'

module OrderSMS
  account_sid = ENV['SID']
  auth_token = ENV['AUTH_TOKEN']
  CLIENT = Twilio::REST::Client.new(account_sid, auth_token)

  FROM = ENV['TWILIO_NUMBER']


  def self.send(message)
    CLIENT.messages.create(
      from: FROM,
      to: ENV['REAL_NUMBER'],
      body: message
    )
  end
end