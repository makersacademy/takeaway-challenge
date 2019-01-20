require 'rubygems'
require 'twilio-ruby'

class Sendsms
  def send_message(body)
    account_sid = ENV['Twilio_acc_sid'] 
    auth_token = ENV['Twilio_auth_code']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.messages.create(
                                 from: ENV['Twilio_number'],
                                 body: body,
                                 to: ENV['Personal_number']
                               )
    return message.sid
  end
end
