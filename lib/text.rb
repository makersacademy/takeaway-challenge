require_relative 'dish'
require_relative 'menu'
require_relative 'order'
require 'twilio-ruby'

class Text
  TWILIO_PHONE_NUMBER = "+441698313045"
  ACCOUNT_SID = 'AC33738fa4d68c2290ddf1aad512d2eb28'
  AUTH_TOKEN = '0b8f6caff5ce8389821f8110a2c2ffb7'
  HOURS_UNTIL_ARRIVAL = 1

  attr_reader :time, :phone_number

  def initialize
    @time = time
    @send_sms = send_sms
  end


  def time
    time = Time.new + 60 * 60 * HOURS_UNTIL_ARRIVAL
    time.strftime("%H:%M")
  end

  def send_sms
    client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)

    from = TWILIO_PHONE_NUMBER
    to = "+447912210220"
    body = "Thank you, Your order will be delivered before #{@time}"

    client.api.account.messages.create(
    from: from,
    to: to,
    body: body
    )

  end

end
