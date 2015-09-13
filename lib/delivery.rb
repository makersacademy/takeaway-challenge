require_relative '../.env.rb'
require 'twilio-ruby'

module Delivery

  def time_in_hour
    (Time.now + 3600).strftime("%H:%M")
  end

  def order_message
    "Hey there! You're curry is on it's way and will arrive by #{time_in_hour}"
  end

  def send_text(customer)
    @client = Twilio::REST::Client.new ENV[:account_sid], ENV[:auth_token]
    @client.messages.create(
    from: '+441290211268',
    to: customer.mobile,
    body: order_message
    )
  end

end