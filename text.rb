class TwilioAdapter

  attr_reader :client

  account_sid = 'ACbd5d9bebb38ff6e46ea9426ec80f0f6d'
  auth_token = '6dbf8df5888bf320d8949c456dcde209'

  def initialize(client = Twilio::REST::Client.new(account_sid, auth_token))
    @client = client
  end

  def send_sms(body:, to:, from: "+447360542270")
    client.messages.create(
      to: "+447824701051",
      from: "+447360542270",
      body: "Thank you! Your order was placed and will be delivered before 18:52"
    )
  end
end