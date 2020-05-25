require 'twilio-ruby'

class SMS

  attr_accessor :account_sid, :auth_token, :phone_number

  TIME_FORMAT = "%H:%M"
  MAX_DELIVERY_TIME = 60 * 60

  def initialize(requirements, client)
    @client = Twilio::REST::Client.new(requirements[:account_sid], requirements[:auth_token])
    @requirements = requirements
  end

 
  def send_message
    message = @client.messages.create(
    from: '+12565769593',
    to: @phone_number,
    body: body
    )
  end

  private

  def body
    "Thank you, order received! It will be delivered before #{delivery_time}"
  end

  def delivery_time
    (Time.now + MAX_DELIVERY_TIME).strftime(TIME_FORMAT)
  end

  def variables
    @account_sid = ENV[TWILIO_ACCOUNT_SID]
    @auth_token = ENV[TWILIO_AUTH_TOKEN]
    @phone_number = ENV[PHONE]
  end

end
