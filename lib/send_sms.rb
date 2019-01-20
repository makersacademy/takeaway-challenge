require 'twilio-ruby'
require 'dotenv'

Dotenv.load


class SMSMessage

  def initialize
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_ACCOUNT_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @from = ENV["FROM_NUMBER"]
    @to = ENV["TO_NUMBER"]
  end

  def send_sms_message(total_order, total_price)
    @client.messages.create(
      from: @from,
      to: @to,
      body: "Thank you! Your order was placed with a total order of #{total_order} and price of £#{total_price} " +
      "will be delivered before #{Time.now + 1*60*60}"
    )
  end
end
