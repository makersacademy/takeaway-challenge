class Sender
  require 'twilio-ruby'

  attr_reader :twilio, :client, :time

  ACCOUNT_SID = 'ACd319a65e921b7f3a98db79f2f6a2af51'
  AUTH_TOKEN = 'c00d3e818687c0d2b1121179cecfece4'

  def initialize(twilio = Twilio, time = Time,
    client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN))
    @twilio = twilio
    @client = client
    @time   = time
  end

  def send
    client.api.account.messages.create(from: '+447533039151',
      to: '+447951136210', body: text)
  end

  def text
    "Thank you! Your order was placed and will be delivered "\
    "before #{delivery_time}"
  end

  def delivery_time
    t = time.now + 3600
    t.strftime "%H:%M"
  end
end
