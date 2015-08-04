require 'twilio-ruby'

class TwilioMessage

  ACCOUNT_SID = ENV['ACCOUNT_SID']
  AUTH_TOKEN = ENV['AUTH_TOKEN']

  def text_message(total)
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    @client.messages.create(
      from: '+44 1773252063',
      to: '+44 7951569995',
      body: payment_message(total)
      )
  end

  def payment_message(total)
    time = Time.new + 1800
    "Thank you! Your order of $#{total} was place and will be delivered before #{time.strftime("%I:%M %p")}"
  end
end