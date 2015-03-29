require 'rubygems'
require 'twilio-ruby'

module Checkout1
  def complete(order = current_order)
    send_message
    string_order = order.map { |key, value| "#{key}: #{value}" }.join(' ')
    'You ordered: ' + string_order + ' at a cost of: £' + @total.to_s
  end

  def send_message
    account_sid = "ACbcc9164f319e3971f2f7a47b625c4bf0"
    auth_token = "59355d0298cd6b3a08322d78328bc4d7"
    @client = Twilio::REST::Client.new account_sid, auth_token
    time = (Time.now.hour + 1).to_s + ":" + (Time.now.min).to_s
    message = @client.account.messages.create(
      body: "Thanks! Your order has been placed and will arrive at #{time}",
      to:  "+447527428379",
      from: "+441588242013")
  end
end