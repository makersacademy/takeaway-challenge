require 'twilio-ruby'

class Message
  SUCCESS_MSG = "Thank you! Your order was placed and will be delivered before 18:52"

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send
    from_num = ENV["TWILIO_FROM_NUM"]
    to_num = ENV["TWILIO_TO_NUM"]

    @client.messages.create(from: from_num, to: to_num, body: SUCCESS_MSG)
  end
end
