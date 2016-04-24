require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Message

  def initialize
    account_sid = "AC177be96a7d6992580c6cb6ea91135ca6"
    auth_token = "21c6dceae18f89be74e334681da93114"
    client = Twilio::REST::Client.new account_sid, auth_token
    @from = "+441277424331"
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
