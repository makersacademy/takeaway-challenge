# require 'twilio-ruby'
#
# class Message
#   account_sid = 'ACfd4d6d93d87afd8b33d19ae9725e9fc8'
#   auth_token = 'eb02b0bb2ebe1f073f2d776a36de3b79'
#
#   @client = Twilio::REST::Client.new account_sid, auth_token
#
#   from = '+441915801850'
#   customer = ''
#
#   @client.account.messages.create({
#     from: from,
#     to: customer,
#     body: "order successfully placed"
#   })
#
#   def send_sms
#   end
# end
