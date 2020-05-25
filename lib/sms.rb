require 'twilio-ruby'

class SMS

  attr_accessor :account_sid, :auth_token, :phone_number

  TIME_FORMAT = "%H:%M"
  MAX_DELIVERY_TIME = 60 * 60
  # ACCOUNT_SID = ACe7ff71248c340a3a325c62f33ed1c71c
  # AUTH_TOKEN = fb7471f019049d6a39a8de701c879f7f

  def initialize(account_sid, auth_token, phone_number)
    @account_sid = ENV[TWILIO_ACCOUNT_SID]
    @auth_token = ENV[TWILIO_AUTH_TOKEN]
    @phone_number = ENV[PHONE]
  end

  def 

  def delivery_time
    (Time.now + MAX_DELIVERY_TIME).strftime(TIME_FORMAT)
  end

  def body
    "Thank you, order received! It will be delivered before #{delivery_time}"
  end

  def send_message
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.messages.create(
    from: '+12565769593',
    to: @phone_number,
    body: body
    )
  end

end
