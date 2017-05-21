require 'sinatra'
require 'twilio-ruby'
require 'date'

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
    from: '+441344567722',
    to: '+447450463745',
    body: message_contents
    )
  end

  def setup_twilio_client
    account_sid = "AC009fa2cf455a6e32ed0f211052ded1ee"
    auth_token = "cd1eb8b834719383f2b9235565c0c529"
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def message_contents
    "Thank you for your order!
    TOTAL: £#{@total_price}.
    It will be with you at #{@estimated_time.strftime("%H:%M")}!"
  end
end
