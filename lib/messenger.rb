require 'twilio-ruby'

class Messenger

  ACCOUNT_SID = 'REMOVED'
  AUTH_TOKEN = 'REMOVED'

  def initialize
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  end

  def send_message order
    message_details = { body: generate_body, phone_number: order.contact_number }
    validate_phone_number message_details
  end

  private

  def validate_phone_number message_details
    raise "invalid phone number" unless message_details[:phone_number] =~ (/^\+\d{13}$/)
    send_to_twilio message_details
  end

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
      :from => 'REMOVED',
      :to => message_details[:phone_number],
      :body => message_details[:body],
    })
  end
end
