require 'twilio-ruby'
# require 'dotenv'
# Dotenv.load

class Messenger

attr_reader :client

  def initialize(codes = CODES)
    @client = Twilio::REST::Client.new(codes[:account_sid], codes[:auth_token])
  end

  def send_message
    @client.account.messages.create(
      from:  twilio_number,
      to:    my_number,
      body:  delivery_message,
    )
  end

private

  CODES = {
           account_sid: "AC5922eadd2a62729a4413d444e0c955d0",
           #ENV['TWILIO_ACCOUNT_SID'],
           auth_token: "6ec78248879ac88fb71272cf5acba8f4"
           #ENV['TWILIO_AUTH_TOKEN']

         }

  def twilio_number
    "+441599312045"
    #ENV['TWILIO_NUMBER']
  end

  def my_number
    "+447706294543"
  # ENV['MY_NUMBER']
  end

  def delivery_message
    "Thank you! Your order will be delivered before " + delivery_time
  end

  def  delivery_time
   (Time.now + (60*60) ).to_s
  end

end
