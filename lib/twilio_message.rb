require 'twilio-ruby'


class TwilioMessage

  ACCOUNT_SID = #to be filled
  AUTH_TOKEN = #to be filled

  def text_message(total)
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    @client.messages.create(
      from: '+44 1753889055',
      to: '+44 7500333666',
      body: payment_message(total)
      )
  end

  def payment_message(total)
    time = Time.new + 1800
    "Thank you! Your order of $#{total} was place and will be delivered before #{time.strftime("%I:%M %p")}"
  end
end