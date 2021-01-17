require 'twilio-ruby'

class Text

  attr_reader :client

  def initialize
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send(number)
    @client.messages.create(
      from: '+18652217160',
      to: number,
      body: "Thanks for your order. Your delivery should arrive by #{Time.new.hour + 1}:#{Time.new.min}"
    )
  end

end
