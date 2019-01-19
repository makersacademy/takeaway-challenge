require 'rubygems'
require 'twilio-ruby'


class Sendsms
  def send_message(body)
    account_sid = 'AC90ba00c3b14765248a33c1c36e863800'
    auth_token = '9303091f83aa503a1bad647de9b21f3c'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    
    message = @client.messages.create(
                                 from: 'twilio_number',
                                 body: body,
                                 to: 'personal_number'
                               )
    
    end
end
