require_relative 'user_input'
require 'twilio-ruby'
class Sms

  def initialize(order_class: Order)
    @order_class = order_class
  end

  def send_confirmation_sms(time)
  puts "Thank you for ordering, your order will be delivered by #{time}"

  # To find these visit https://www.twilio.com/user/account
  account_sid = "ACfbbd1bfbdd3f8a85e312c0de34e5adbc"
  auth_token = "4625269f3f4dcdf8eb7aec406ace6cb1"

  @client = Twilio::REST::Client.new account_sid, auth_token

  @message = @client.messages.create(
    to: "+447739733690",
    from: "441749200134",
    body: "Thank you for ordering, your order will be delivered by #{time}")

  end
end
