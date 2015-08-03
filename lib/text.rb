require "twilio-ruby"

class Text

  def initialize
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_text(message)
    @client.account.messages.create( from: ENV["TWILIO_NUM"], to: ENV["PHONE"], body: message )
    message
  end

end