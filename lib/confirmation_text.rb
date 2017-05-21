require 'sinatra'
require 'twilio-ruby'
require 'date'
require 'dotenv/load'
Dotenv.load('settings.env')

class ConfirmationText

  def initialize(total_price)
    @estimated_time = Time.now + 3600
    setup_twilio_client
    @total_price = total_price
    send_sms
  end

  private

  def send_sms
    @client.account.messages.create(
    from: ENV['FROM_NUMBER'],
    to: ENV['TO_NUMBER'],
    body: message_contents
    )
  end

  def setup_twilio_client
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def message_contents
    "Thank you for your order!
    TOTAL: £#{@total_price}.
    It will be with you at #{@estimated_time.strftime("%H:%M")}!"
  end
end
