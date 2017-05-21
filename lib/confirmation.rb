require 'twilio-ruby'
require_relative 'order'

class Confirmation
  attr_reader :time

  def initialize
    account_sid = "ACd4c4fc4bafc1f64663c610cb0755854c"
    auth_token = "bb5a90236df6bef7de2039c3f0127dc8"
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @time = (Time.now + 3600).strftime("%H:%M:%S")
  end

  def complete_order
    send_sms("Thank you! Your order was placed and will be delivered before #{time}.")
  end

  def send_sms(message)
    @client.messages.create(
        :from => "+441483608668",
        :to => "+447940559363",
        :body => message
        )
  end
end

  # Your Auth Token from www.twilio.com/console
