class Text

  def initialize(client = Twilio::REST::Client.new(acct_sid, auth_token))
    @client = client
  end

  def send_text(message)
    @client.messages.create(
    to: ENV['CUSTOMER_NUMBER'],
    from: ENV['TWILIO_NUMBER'],
    body: message)
  end

  def acct_sid
    ENV['TWILIO_ACCOUNT_SID']
  end

  def auth_token
    ENV['TWILIO_AUTH_TOKEN']
  end

  private

  def message
    est_time = (Time.new + 60*60).strftime("%H:%M")
    "Thank you! Your order was placed and will be delivered before #{est_time}"
  end
end
