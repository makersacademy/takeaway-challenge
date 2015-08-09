require 'twilio-ruby'

class TwilioAPI
  ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
  AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']

  def text_message(total)
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    @client.messages.create(
      from: '+44 1759392049',
      to: '+44 7851758911',
      body: payment_message(total))
  end

  def payment_message(total)
    time = Time.new + 3600
    "Thank you! Your order of £#{total} was placed and will be"\
    " delivered before #{time.strftime("%H:%M")}"
  end
end

