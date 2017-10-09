# require 'twilio-ruby'
#
# class SendSMS
#
#   def initialize(sms_body)
#     send_sms(sms_body)
#   end
#
# private
#   def send_sms(sms_body)
#     # put your own credentials here
#     account_sid = 'ACfbd0b536cfae55baa881d7641a95c2f3'
#     auth_token = '3075257dd7ac309bba3e310b4c9d0b30'
#
#     # set up a client to talk to the Twilio REST API
#     @client = Twilio::REST::Client.new(account_sid, auth_token)
#
#     @client.messages.create(
#       from: '+447800933557',
#       to: '+447800933557',
#       body: sms_body
#     )
#   end
# end
