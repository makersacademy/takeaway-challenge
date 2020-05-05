require 'twilio-ruby'

class Text

  attr_reader :client, :from, :to, :body

  def initialize(client = Twilio::REST::Client.new(
    ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  )
    @client = client
    @from = ENV['TWILIO_FROM']
    @to = ENV['TWILIO_TO']
    @body = 'Your order will be delivered before 17:00'
  end

  def send_sms
    @client.messages.create(@from, @to, @body)
  end
end
