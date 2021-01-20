require 'twilio-ruby'

class Text
  attr_reader :from, :to
  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token

    @from = ENV['SECRET_TWILIO_NUMBER']
    @to = ENV['MY_SECRET_NUMBER']
    @time = (Time.now + 4000)
  end

  def send_text
    @client.messages.create(
      from: @from,
      to: @to,
      body: "Thank you! Your order was placed and will be delivered before #{@time.strftime('%I:%M %p')}"
    )
  end
end
