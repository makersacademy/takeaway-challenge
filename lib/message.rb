require 'twilio-ruby'

class Message
  def send_message
    account_sid = "AC570ba5e035181f51cafbd0ad7642fb6d"
    auth_token = "8b3f19279f1d7012f2333dce323348c6"

    @client = Twilio::REST::Client.new account_sid, auth_token
    sms = @client.account.messages.create({
                                            from: '+441929290015',
                                            to: '+447943743401',
                                            body: "Hello, your order will be delivery by #{time_to_delivery}"
                                          })
    puts sms.body
  end

  def time_to_delivery
    p (Time.now + 3600).strftime "%H:%M"
  end
end

message = Message.new
p message.time_to_delivery
message.send_message
