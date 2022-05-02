require 'twilio-ruby'
require 'dotenv/load'

class SMS

ETA = (Time.now + 3600).strftime("%H:%M")

  attr_reader :sent, :phone_number

  def initialize
    @sent = false
  end

  def sms
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Your order has been sent and will be with before #{ETA}",
        to: "+#{@phone_number}",
        from: ENV['TWILIO_PHONE'])

    puts message.sid
  end

  def send_sms(phone_number)
    @phone_number = phone_number
    sms
    @sent = true
    sms_sent_confirmation
  end
  #do I need both sent? AND the sent attr_reader???
  def sent?
    @sent
  end

  def sms_sent_confirmation
    "A confirmation message has been sent to the number you provided"
  end
end
