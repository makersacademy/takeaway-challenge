class Message
  require 'twilio-ruby'
  attr_reader :my_number, :time
  def initialize
    @my_number = '+447510060718'
    @time = Time.now + 60 * 60
  end

  def send_message
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
    from: '+12069844265',
    to: @my_number,
    body: "Your order is confirmed and it will arrive at #{@time.strftime("%I:%M %p")}"
    )
  end
end
