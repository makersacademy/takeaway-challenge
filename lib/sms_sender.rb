class SMSSender
  def initialize(client)
    @client = client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
  end

  def send(from, to, body)
    @client.messages.create(from: from, to: to, body: body)
  end
end