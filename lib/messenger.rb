require 'twilio-ruby'

class Messenger

  ACCOUNT_SID = 'ACa5ef8ead3ef15b82f3e25c23c9504fa5'
  AUTH_TOKEN = 'b8c8ffa5636d5b69488e8a210dc3a1f2'

  def initialize
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  end

  def send_message order
    body = generate_body
    message_details = { body: body, phone_number: order.contact_number }
    send_to_twilio message_details
  end

  private

  def generate_body
    delivery_time = calculate_delivery_time
    text = "your order has been placed delivery time: #{delivery_time}"
  end

  def calculate_delivery_time
    time = Time.now + 60*60
    delivery_time =  time.strftime("%H:%M")
  end

  def send_to_twilio message_details
    @client.account.messages.create({
      :from => '+441695302059',
      :to => message_details[:phone_number],
      :body => message_details[:body],
    })
  end
end
