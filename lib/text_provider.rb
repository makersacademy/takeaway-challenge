# require 'rubygems' # not necessary with ruby 1.9 but included for completeness
# require 'twilio-ruby'
# require_relative 'takeaway'
#
# class TextProvider
#   attr_reader :client
#   # put your own credentials here
#   account_sid = 'AC034ed165a8e938089eb0d73e01a10f35'
#   auth_token = '6b7a74650475a79697e3d1b8a2998b3b'
#
#   # set up a client to talk to the Twilio REST API
#   @client = Twilio::REST::Client.new account_sid, auth_token
#
#   # # alternatively, you can preconfigure the client like so
#   # Twilio.configure do |config|
#   #   config.account_sid = account_sid
#   #   config.auth_token = auth_token
#   # end
#
#   # and then you can create a new client without parameters
#   @client = Twilio::REST::Client.new
#
#   def send_text
#     @client.messages.create(
#     from: '+447479928351',
#     to: '+447479928351',
#     body: 'Thank you! Your order was placed and will be delivered before 18:52'
#     )
#   end
#
# end
