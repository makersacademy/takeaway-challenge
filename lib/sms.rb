require 'twilio-ruby'
require 'dotenv/load'

class Sms
  def initialize(sms_client = TwilioClient)
    @sms_client = sms_client.new.client
    @to = ENV["MY_NUMBER"]
    @from = ENV["TWILIO_NUMBER"]


  def send(message)
    @sms_client.api.account.messages.create(
      to: @to,
      from: @from,
      body: message
     )
     puts "Order received!"
  end
end
