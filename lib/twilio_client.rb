require 'twilio-ruby'

class TwilioClient
  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_order_confirmation(customer_name, customer_number)
    client.messages.create(
      from: twilio_number,
      to: customer_number,
      body: "Thank you for your order, #{customer_name}."
    )
  end

  private

  def account_sid
    ENV['TWILIO_ACCOUNT_SID']
  end

  def auth_token
    ENV['TWILIO_AUTH_TOKEN']
  end

  def twilio_number
    ENV['TWILIO_NUMBER']
  end
end

