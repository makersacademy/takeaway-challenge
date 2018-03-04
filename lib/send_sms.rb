require 'twilio-ruby'
require 'time'
require 'envyable'
Envyable.load('config/env.yml')

class SendSMS
  def send(phone_number)
    sms_status = true # sms sent status will turn false if sms not sent
    begin
      @client = Twilio::REST::Client.new ENV["TWILLIO_ACCOUNT_SID"], ENV["TWILLIO_AUTH_TOKEN"]
      @client.messages.create(
          body: "Thank you! Your order was placed and will be delivered before #{in_40_mins}",
          to: phone_number, # Replace with your phone number
          from: ENV["TWILLIO_PHONE"]) # Replace with your Twilio number
    rescue Twilio::REST::TwilioError => e
      sms_status = false
      # puts e.message # Enable to print actual error message when msg not sent
    end
    sms_status
  end

private

  def in_40_mins
    (Time.now + 2400).strftime("%H:%M")
  end

end
