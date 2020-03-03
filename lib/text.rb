require 'dotenv/load'
require 'twilio-ruby'

class Text

  attr_reader :customer_no, :message

  def initialize
    @customer_no = nil
    @message = nil
  end

  def confirmation_message
    customer_no
    create_message
    send_message
  end

  def create_message
    @message = "Your order has been placed and will arrive before #{delivery_time}"
  end

  def customer_no
    puts "Input your number"
    @customer_no = gets.chomp.to_s
  end

  def send_message
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["MYAUTH_KEY"]
    client = Twilio::REST::Client.new(account_sid, auth_token)
    
    client.messages.create(
    from: ENV["TWILIO"],
    to: @customer_no,
    body: @message
    )
  end

  private

  def delivery_time
    delivery_time = (Time.now + 1 * 60 * 60).strftime("%k:%M")
  end

end
