require 'twilio-ruby'

class Sms

  @@ACCOUNT_SID = "REDACTED"
  @@AUTH_TOKEN = "REDACTED"
  @@TWILIO_NUMBER = "REDACTED"

  def initialize(sid = @@ACCOUNT_SID, token = @@AUTH_TOKEN)
    @client = Twilio::REST::Client.new sid, token
  end

  def send_confirmation_message(phone_number, order_number, total_cost)
    hour = Time.now.hour == 23 ? "00" : (Time.now.hour + 1).to_s
    minute = Time.now.min < 10 ? "0" + Time.now.min.to_s : Time.now.min
    msg = "Makeroo here. Just to confirm, you've placed order ##{order_number}, for #{total_cost}. It'll be with you by #{hour}:#{minute}."
    send(phone_number, msg)
  end

  private

  def send(phone, msg)
    @client.messages.create(from: @@TWILIO_NUMBER, to: phone, body: msg)
  end

end
