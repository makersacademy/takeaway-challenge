require 'twilio-ruby'
require 'time'

class Message

  attr_reader :time

  def initialize
    @time = Time.now + 1 * 60 * 60
    @time = @time.strftime("%k:%M")
  end

  def text_message(number)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
    from: '12513571279',
    to: number,
    body: "Thank you! Your order was placed and will be delivered before #{@time}"
    )
  end
end
