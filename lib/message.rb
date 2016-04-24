require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Message

  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token
    @from = ENV['FROM']
    @twilio = client.account.messages
  end

  def send
    message = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    @twilio.create(
      from: @from,
      to: ENV['PHONE_NUMBER'],
      body: message
                  )
  end

  private

  def delivery_time
    "#{(Time.new.hour + 1)}:#{Time.new.min}"
  end

end
