require 'rubygems'
require 'twilio-ruby'

class Messenger

  attr_reader :client, :from, :to

  def initialize
    account_sid = 'AC688a8ef352826cd3d94b45f0f6b9ea05'
    auth_token = 'b1e9a5d17ac387dea9062b62b6b66d88'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @from = '+441315101868'
    @to = '+447472842671'
  end

  def message
    time = (Time.now + 3600).strftime("%H:%M")
    @client.messages.create(
    from: from,
    to: to,
    body: "Thank you for your order. It should arrive before #{time}."
    )
  end
end
