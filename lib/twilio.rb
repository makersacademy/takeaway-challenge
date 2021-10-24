# require 'twilio-ruby'
CUSTOMER_PHONE = ENV['MY_PHONE']

class Twilio
  attr_reader :account_sid, :auth_token, :restaurant_phone, :customer_phone, :client
  # ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
  # AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
  # TWILIO_PHONE = ENV['RESTAURANT_PHONE']
  TWILIO_200_RESPONSE = "message_sent".freeze
  # def initialize(account_sid = ACCOUNT_SID, auth_token = AUTH_TOKEN, twilio_phone = TWILIO_PHONE)
  #   @account_sid = account_sid
  #   @auth_token = auth_token
  #   @twilio_phone = restaurant_phone
  #   # @client = Twilio::REST::Client.new account_sid, auth_token
  # end

  def send_message(body, *customer_phone)
    # client.messages.create(
    #   from: twilio_phone,
    #   to: customer_number(customer_phone),
    #   body: body
    # )
  end

  def customer_number(customer_number)
    return customer_phone if customer_number.nil?
    customer_number
  end
end
