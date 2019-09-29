# sms.rb
require 'twilio-ruby'

class Sms

  def initialize
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = ENV["TWILIO_NUMBER"]
    @to = ENV["TWILIO_MOBILE"]
  end

  def send(message)
    @client.messages.create(
    from: @from,
    to: @to,
    body: message
    )
  end

end
