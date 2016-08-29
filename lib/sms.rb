require_relative 'user_input'
require 'twilio-ruby'
class Sms

  def initialize(order_class: Order)
    @order_class = order_class
  end

  def send_confirmation_sms(time)
  puts "Thank you for ordering, your order will be delivered by #{time}"

  # To find these visit https://www.twilio.com/user/account
  account_sid = "AC256ea42576a918336a85b5e87d467bed"
  auth_token = "4e7acd45a7842c0843c9bf750c63d7e7"

  @client = Twilio::REST::Client.new account_sid, auth_token

  @message = @client.messages.create(
    to: "+447739733690",
    from: "+441749200134",
    body: "Thank you for ordering, your order will be delivered by #{time}")

  end
end
