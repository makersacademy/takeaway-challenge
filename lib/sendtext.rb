# Sending an SMS using the Twilio API
# pw: csw102791123456
require 'twilio-ruby'

class TwilioController

  def initialize(twilio_class = Twilio::REST::Client)
    account_sid = 'AC86d96f3d6d6d318ac7c7371bbf2daf4c'
    auth_token = '179c1ed1583f6e796a598d87f48aafd9'
    @client = twilio_class.new account_sid, auth_token
  end

  def send_text_message(message)
    @client.messages.create(
        body: "#{message}",
        to: "+447475859485",
        from: "+441375351795")
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
#     self.class.messages << Message.new(from: "+441375351795", to: "+447475859485", body: "Te #{settime.min1}:#{settime.sec1} today")
#   end
# end
