class SMSClient
  def initialize
    @client = Twilio::REST::Client.new(
      ENV.fetch("TWILIO_ACCOUNT_SID"),
      ENV.fetch("TWILIO_AUTH_TOKEN"),
    )
  end

  def messages
    self
  end

  def create
    @client.messages.create('hello')
  end

  def send_message(from:, to:, body:)
    @client.messages.create(from: from, to: to, body: body)
  end
end
