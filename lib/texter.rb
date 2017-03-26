require 'twilio-ruby'
require_relative 'time_function'

# class is responsible for sending texts to customers
class Texter
  attr_reader :client

  def initialize
    account_sid = 'AC6612e0baf00f044822ca233dcccb24b6'
    auth_token = 'ad10c6c767e5ff7b3d501e41f21fd607'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message(number)
    @client.messages.create(
      from: '+441530382009',
      to: "+#{number}",
      body: "Your order was placed and will be delivered before #{TimeFunction.new.time_plus_one_hour}. Thank you! 🍖"
    )
  end
end
