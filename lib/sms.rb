require 'twilio-ruby'
class SMS
  ACCOUNT_SID = 'AC1e23ec21dbfbe55dca0adb3687afdfe0'
  AUTH_TOKEN = '612c426da5038b7a02cc2e7786143f8d'
  TWILIO_PHONE = '+441782454810'
  RECEIVER = '+447702602704'

    def initialize
      @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    end

    def send_text
      time = (Time.now + 60 * 60)
      message = "Thank you! Your order will be delivered before #{time}"
      @client.account.messages.create({ from: TWILIO_PHONE, to: RECEIVER, body: message  })
    end

end
