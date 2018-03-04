require 'twilio-ruby'
require 'time'
require 'envyable'
Envyable.load('config/env.yml')

class SendSMS
  def send(phone_number, total)
    sms_status = true # sms sent status will turn false if sms not sent
    begin
      @client = Twilio::REST::Client.new ENV["TWILLIO_ACCOUNT_SID"], ENV["TWILLIO_AUTH_TOKEN"]
      @client.messages.create(
          body: delivery_message + "#{total}",
          to: phone_number, # Replace with your phone number
          from: ENV["TWILLIO_PHONE"]) # Replace with your Twilio number
    rescue Twilio::REST::TwilioError => e
      sms_status = false
      # puts e.message # Enable to print actual error message when msg not sent
    end
    sms_status
  end

private

  def delivery_message
    "Thank you from Blah Blah Food! We're preparing your order" +
    "and should be with you before #{in_40_mins}\n Your total is £"
  end

  def in_40_mins
    (Time.now + 2400).strftime("%H:%M")
  end

end
