require "Twilio-ruby"

class SMS

  attr_reader :client
  #FORMATTED_TIME = "%H:%M"
  ACCOUNT_SID = 'blahblahblah'
  AUTH_TOKEN = 'bl4hblah4h4h4'
  FROM = "+441202029038"
  TO = "+01189998819991197253"

  def initialize(client)
    @client = client || Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  end

  def delivery
    client.messages.create(message_content)
  end

  def message_content
    {
      from: FROM,
      to: TO,
      body: "Thanks for your order, it will arrive at " % delivery_time
    }
  end

  def delivery_time
    (Time.now + 3600).strftime("%H:%M")
  end
end
