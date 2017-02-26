require 'dotenv'
require 'twilio-ruby'

class TextConfirmation

  attr_reader :order_finished

  def order_finished
    send_message
  end

  private

  def send_message
    Dotenv.load
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    call_from = ENV['TWILIO_NUMBER']
    call_to = ENV['PHONE_NUMBER']

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
        :to => call_to,
        :from => call_from,
        :body => "Thank you! Your order was placed and will be delivered before #{est_delivery_time}",
      })
  end

  def est_delivery_time
    (Time.now+3600).to_s[11..15]
  end

end
