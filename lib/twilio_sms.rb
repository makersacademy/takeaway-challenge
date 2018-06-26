require 'twilio-ruby'

class TwilioSMS

  attr_reader :delivery_time, :sms_sent

  def initialize
    @delivery_time = Time.now
    @sms_sent = false
  end

  def time
    @delivery_time = delivery_time + (1 * 60 * 60)
  end

  def send_sms
    time
    # Your Account SID from www.twilio.com/console
    account_sid = ""

    # Your Auth Token from www.twilio.com/console
    auth_token = ""

    @client = Twilio::REST::Client.new account_sid, auth_token
    # message = @client.messages.create(
    @client.messages.create(
        body: "Thank you! Your order will be delivered before #{delivery_time}",
        to: "",    # Replace with your phone number
        from: "")  # Replace with your Twilio number

    # puts message.sid
    @sms_sent = true
  end

  private

  def sms_sent?
    @sms_sent
  end

end
