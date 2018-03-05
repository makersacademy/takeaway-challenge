require 'twilio-ruby'
require 'time'
require 'envyable'
Envyable.load('config/env.yml')

# SendSMS class definition:
# This class is responsible for sending text messages to customers
# to secure Twillio SID and Authtentication token, they're saved as ENV variables
# and stored in /config/env.yml file (added to .gitignore)

class SendSMS
# main method for sending text, takes phone number and total amount as arg
  def send(phone_number, total, client_class= Twilio::REST::Client)
    sms_status = true # sms sent status will turn false if sms not sent
    begin
      @client = client_class.new ENV["TWILLIO_ACCOUNT_SID"], ENV["TWILLIO_AUTH_TOKEN"]
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

# delivery_message simply returns the string to send as text
  def delivery_message
    "Thank you from Blah Blah Food! We're preparing your order" +
    "and should be with you before #{in_40_mins}\n Your total is £"
  end

# in_40_mins returns Time.now + 40 mins as HH:MM
  def in_40_mins
    (Time.now + 2400).strftime("%H:%M")
  end

end
