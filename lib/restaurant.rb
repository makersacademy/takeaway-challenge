require 'twilio-ruby'
require_relative 'twilio_credentials'

class Restaurant

  WAIT_TIME = 3600 # in seconds

  def initialize
    @account_sid = TWILIO_ACCOUNT_SID
    @auth_token = TWILIO_AUTH_TOKEN
    @from = FROM
  end

  def place(order, number = nil)
    @order = order
    deadline = wait.strftime('%H:%M')
    message = "Thank you! Your order was placed and will be delivered before #{deadline}"
    return message if number == nil?
    send_sms(message, number)
  end

  private

  def send_sms(message, number)    
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    @client.messages.create(
      from: @from,
      to: number,
      body: message
    )
    message
  end

  def wait
    wait_time = WAIT_TIME + Time.now.to_i
    wait = Time.at(wait_time)
  end

end
