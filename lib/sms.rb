require "twilio-ruby"

class SMS
  attr_reader :client, :from, :to
  DELIVERY_TIME = (Time.now + 60 * 60).strftime("%H:%M")

  def initialize(client, account_sid, auth_token, from, to)
    @client = client || Twilio::REST::Client.new(account_sid, auth_token)
    @account_sid = account_sid
    @auth_token = auth_token
    @from = from
    @to = to
  end

  def send_text
    client.messages.create(
      from: from,
      to: to,
      body: "Thank you! Your order was placed and will be delivered before #{DELIVERY_TIME}."
    )
  end
end
