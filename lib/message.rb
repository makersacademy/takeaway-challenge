require 'twilio-ruby'

class Message

  def initialize(message_builder = "@client.messages.create(body: content, to: phone_number, from: +441942316170)",output="message.sid")
    @account_sid = "AC1b3f9e870c3913eada3b72f4cfac5bad"
    @auth_token = "7e570ec2d3380d8daf129f7fa0ab2d67"
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @message_builder = message_builder
    @output = output
  end

  def send(content)
    phone_number = +441942316170 #this should be changed to my mobile number before a message will be sent
    message = eval(@message_builder)
    return eval(@output)
  end
end