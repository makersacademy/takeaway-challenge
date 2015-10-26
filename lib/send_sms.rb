# require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

class SendSMS

  def initialize(order_summary, total)
    send_sms(order_summary, total)
  end

  def send_sms(order_summary, total)

    @client = Twilio::REST::Client.new twilio_account_sid, twilio_auth_token

    @client.account.messages.create(
    	from: twilio_phone_number,
    	to: client_phone_number,
    	body: "#{message}\n\n#{order_summary}\n\n#{total}" )
  end

  private

  def message
    """\nYour order has been confirmed!\nIt's being cooked up right now and will be delivered by #{in_one_hour}\nGet ready to enjoy your meal!"""
  end

  def in_one_hour
    (Time.now + 3600).strftime("%H:%M")
  end

  def twilio_account_sid
    ENV['TWILIO_ID']
  end

  def twilio_auth_token
    ENV['TWILIO_AUTH_TOK']
  end

  def client_phone_number
    ENV['MY_PHONE_NUMBER']
  end

  def twilio_phone_number
    ENV['TWILIO_NUMBER']
  end

end
