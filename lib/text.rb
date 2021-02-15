require 'twilio-ruby'

class Text
  attr_reader :from, :to

  def initialize
    account_sid = ENV['TWILIO_ACC_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @from = ENV['TWILIO_NUMBER']
    @to = ENV['UK_NUMBER']
  end

  def send_text
    @client.messages.create(
    from: @from,
    to: @to,
    body: "Thank you! Your order was placed and will
    be delivered before #{(Time.now + 10 * 60 * 6).strftime("%k:%M")}"
    )
  end

end
