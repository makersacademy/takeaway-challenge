require 'twilio-ruby'
require 'dotenv/load'

class Text

  def initialize(client = Twilio::REST::Client)
    @message = "Thank you! Your order was placed. The total was: "
    @account_sid = ENV['ACCOUNT_ID']
    @auth_token = ENV['AUTH_TOKEN']
    @from = ENV['TWILIO_PHONE']
    @to = ENV['MY_PHONE']
    @client = client.new @account_sid, @auth_token
  end

  def send(total)
    @client.api.account.messages.create(
      from: @from,
      to: @to,
      body: @message + total.to_s
    )
  end

end
