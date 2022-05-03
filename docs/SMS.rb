require 'twilio-ruby'

class SMS

  ETA = (Time.now + 3600).strftime("%H:%M")

  attr_reader :sent, :phone_number

  def initialize
    @sent = false
  end

  def sms

    @client = Twilio::REST::Client.new ENV['account Sid'], ENV['Auth token']
    message = @client.messages.create(
        body: "Thank you! Your order has been logged and will be with before #{ETA}",
        to: "+my number",
        from: ENV['+magic number'])

    puts message.sid
  end

  def send_sms(phone_number)
    @phone_number = phone_number
    sms
    @sent = true
    sms_confirmation
  end

  def sent?
    @sent
  end

  def sms_confirmation
    "Confirmation message has been sent"
  end
end
