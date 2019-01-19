require 'rubygems'
require 'twilio-ruby'

class Sendsms

  def send_message(body)

    account_sid = 'ACba37f19473cb3d3def1a75ea4c07f52f'
    auth_token = '84498757e04b1070037789a2017a6c94'
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages.create(
                             from: 'Your twilio number e.g 01258432996',
                             body: body,
                             to: 'Your personal number e.g. 07743278451'
                           )

                           puts message.sid
                         end
end
