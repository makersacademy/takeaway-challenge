# require 'rubygems'
# require 'twilio-ruby'
#
# class Text
#
#   def send_text
#     account_sid: 'AC409cb5a542492ea21bba664ad4f7023b'
#     auth_token: '085660ae224d98429e9188a51e2e9ae9'
#
#     @client = Twilio::REST::Client.new account_sid, auth_token
#
#     message = @client.account.messages.create({
#       :from => '+447751606789',
#       :to =>
#       :body => 'Here is your order!'
#       })
#   end
#
# end
