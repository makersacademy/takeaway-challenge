require 'bundler'
Bundler.require

class MessageClient

  TWILIO_REST_CLIENT = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

  def initialize(twilio_rest_client = TWILIO_REST_CLIENT)
    @twilio_rest_client = twilio_rest_client
  end

  def confirm_order(customer)
    begin
      send_message_to(customer)
      'message sent'
    rescue RuntimeError
      'message failed to send'
    end
  end

  private

  def send_message_to(customer)
    @twilio_rest_client.messages.create(
      to: customer.number,
      from: ENV['TWILIO_PHONE_NUMBER'],
      body: "Thank you! Your order was placed and will be delivered before " +
            "#{(Time.now.utc - 3600).strftime("%k:%M")}"
    )
  end
end
