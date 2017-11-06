require 'twilio-ruby'
require_relative '../twilio'
require 'basket'

class Order
  attr_reader :delivery_time
  attr_accessor :text

  def initialize
    @text = ""
    @delivery_time = (Time.new + (60 * 60)).strftime("%H:%M")
  end

  def place_order basket
    send_confirmation
    reset_basket basket
  end

  private

  def send_confirmation
    # account_sid = "AC9bdc53ce16000ee247b2f71d99876d87"
    # auth_token = "1a2ad891876c6ef0a1fbefde27e6b214"
    @client = Twilio::REST::Client.new account_sid, auth_token
    @message = @client.messages.create(
      to: my_number,
      from: twilio_number,
      body: "Thanks for your order! It will be delivered before #{@delivery_time}."
    )
    @text = @message.body
  end

  def reset_basket basket
    basket.empty_basket
  end
end
