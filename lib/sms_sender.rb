require 'twilio-ruby'

class SMSSender
  def initialize(client = Twilio::REST::Client)
    @client = client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
  end

  def send_sms(to, body)
    @client.messages.create(from: ENV['TWILIO_NUMBER'], to: to, body: body)
  end
end