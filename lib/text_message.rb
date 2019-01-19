require 'twilio-ruby'

class TextMessage
  attr_reader :client

  def initialize
    @account_sid = 'AC1b3f9e870c3913eada3b72f4cfac5bad'
    @auth_token = '7e570ec2d3380d8daf129f7fa0ab2d67'
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send(phone_number, content)
    to = ('+44' + phone_number.to_s).to_i
    from = ('+44' + '01942316170'.to_s).to_i
    client.messages.create(body: content, to: to, from: from)
    return "sent"
  end
end
