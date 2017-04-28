require 'rubygems'
require 'twilio-ruby'
require 'envyable'
Envyable.load('./config/env.yml', 'development')

module Message

  attr_reader :send_message

  def config
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def confirmation
    "Thanks! Your order will arrive by " + delivery_time
  end

  def delivery_time
    (Time.now + 60 * 60).strftime("%H:%M")
  end

  def send_message
    config
    @client.messages.create(
      from: ENV['FROM_NUMBER'],
      to: ENV['TO_NUMBER'],
      body: confirmation
    )
  end

end
