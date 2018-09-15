require 'twilio-ruby'
class Sms
  attr_reader :sms_message

  def send_message(message)
    @sms_message = "Thank you for your order: your total is £25.50"
    account_sid = 'AC6e71a0f846c529fc6a78cd94109c05c1'
    auth_token = '9ed229ce1eaaea178fb14b72cde36e33'

    @client = Twilio::REST::Client.new(account_sid, auth_token)
    from = '+447859893435' # Your Twilio number
    to = '+447859893435' # Your mobile phone number

    @client.messages.create(
      from: from,
      to: to,
      body: @sms_message
    )
  end
end
