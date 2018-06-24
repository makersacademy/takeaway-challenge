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
    account_sid = "AC7e39b6b96a12214456b2217c17792dd7"

    # Your Auth Token from www.twilio.com/console
    auth_token = "7e454a37dd32ab9f8d6b764984900dd2"

    @client = Twilio::REST::Client.new account_sid, auth_token
    # message = @client.messages.create(
    @client.messages.create(
        body: "Thank you! Your order will be delivered before #{delivery_time}",
        to: "+447956874881",    # Replace with your phone number
        from: "+447481361728")  # Replace with your Twilio number

    # puts message.sid
    @sms_sent = true
  end

  private

  def sms_sent?
    @sms_sent
  end

end
