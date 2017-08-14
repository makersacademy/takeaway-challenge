# Sending an SMS using the Twilio API
# pw: csw102791123456
require 'twilio-ruby'
require_relative 'settime'

class TwilioController

    # Find your Account Sid and Token at twilio.com/console
  account_sid = 'AC86d96f3d6d6d318ac7c7371bbf2daf4c'
  auth_token = '179c1ed1583f6e796a598d87f48aafd9'
    # Create a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  def self.send_text_message
    settime = SetTime.new
    # Send the message
    message = @client.messages.create(
        body: "Thanks! Your order will be delivered before #{settime.hr1}:#{settime.min1} today",
        to: "+447475859485",    # to your phone number
        from: "+441375351795")  # from your Twilio number
    puts "Your confirmation number: #{message.sid}"
    puts "Your order is placed!  Please check your sms for delivery time."
  end
end

# TwilioController.send_text_message

# class FakeSMS
#   Message = Struct.new(:from, :to, :body)
#
#   attr_accessor :messages
#   self.messages = []
#
#   def initialize(_account_sid, _auth_token)
#   end
#
#   def messages
#     self
#   end
#
#   def create(from:, to:, body:)
#     self.class.messages << Message.new(from: "+441375351795", to: "+447475859485", body: "Thanks! Your order will be delivered before #{settime.min1}:#{settime.sec1} today")
#   end
# end
