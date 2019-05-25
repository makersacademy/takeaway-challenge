require 'twilio-ruby'

class SmsSender
  def initialize(sms_client = Twilio::REST::Client )
  @account_sid = 'ACb82ed782e6b2dc3cbd58c57a3593c602'
  @auth_token = 'bfde0287d71df74cbc76ee13b08c5da0'
  @from = '+441183246108' # Your Twilio number
  @to = '+447468462500'
  @client = sms_client.new(@account_sid, @auth_token)
  end

  def confirm_order
    @client.messages.create(
      from: @from,
      to: @to,
      body: "Hey friend!"
    )
  end
end
