require 'twilio-ruby'
require 'time'
require 'envyable'
Envyable.load('config/env.yml')

class SendSMS
  def send(phone_number)
    sms_status = true # sms sent status will turn false if sms not sent
    account_sid = ENV["TWILLIO_ACCOUNT_SID"]  # Your Account SID from www.twilio.com/console
    auth_token = ENV["TWILLIO_AUTH_TOKEN"]  # Your Auth Token from www.twilio.com/console
    begin
      @client = Twilio::REST::Client.new account_sid, auth_token
      @client.messages.create(
          body: "Thank you! Your order was placed and will be delivered before #{fetch_time}",
          to: phone_number, # Replace with your phone number
          from: ENV["TWILLIO_PHONE"]) # Replace with your Twilio number
    rescue Twilio::REST::TwilioError => e
      sms_status = false
      puts e.message
    end
    sms_status
  end

private

  def fetch_time
    "#{(Time.now + 2400).hour}:#{(Time.now + 2400).min}"
  end

end
