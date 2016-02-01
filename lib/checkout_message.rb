
require 'rubygems'
require 'twilio-ruby'
require 'dotenv'


class CheckoutMessage

  attr_reader :time_delivery_expected, :time, :creds

  HOURS_UNTIL_DELIVERY = 1


  def initialize
    @creds = Dotenv.load
    @time = Time.new + (60 * 60 * HOURS_UNTIL_DELIVERY)
  end

  def time_delivery_expected
    time.strftime "%H:%M"
  end

  def send_sms(message)
    account_sid = creds["ACCOUNT_SID"]
    auth_token = creds["AUTH_TOKEN"]
    client = Twilio::REST::Client.new(account_sid, auth_token)
    client.account.messages.create(
      :from => creds["TWILIO_PHONE"],
      :to => creds["TWILIO_DESTINATION_PHONE"],
      :body => message + "Should be with you by #{time_delivery_expected} "
      )
  end


end
