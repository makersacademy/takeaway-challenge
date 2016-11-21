# should send a sms message to confirm the order has been placed and when the order will arrive
require "twilio-ruby"
require_relative "order"

class SendText
  HOUR_LATER = 3600
  attr_reader :time

  def initialize
    account_sid = "AC05c72d3e043289c93495270132150cd8"
    auth_token = "3de9c42641e60663f5a54fe049dc5792"
    @client = Twilio::REST::Client.new account_sid, auth_token
    @time = (Time.now + HOUR_LATER).strftime("%R")
  end

  def complete_order
    send_text("Thank you! Your order was placed and will be delivered before #{time}")
  end

    def send_text(message)
      @client.messages.create(
      :to => "+447939240161",
      :from => "441291606032",
      :body => message)
    end

end
