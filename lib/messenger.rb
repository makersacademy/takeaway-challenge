# Understands the delivery of confirmation message.

require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby' # put your own credentials here

class Messenger

  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def confirm_order
    send_sms("Thank you for your order! Delivery will be before #{generate_delivery_time}")
  end

  def send_sms(message)
    @client.account.messages.create({
      :to => ENV['TWILIO_DESTINATION_PHONE'],
      :from => ENV['TWILIO_PHONE'],
      :body => message
      })
  end

  def generate_delivery_time
    Time.now + 3600
  end
end
