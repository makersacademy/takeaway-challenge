require 'twilio-ruby'
class TextConfirmation
  attr_reader :delivery_time, :client
  def initialize(time = Time)
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @from = '+12058522446' # Your Twilio number
    @to = ENV['MOBILE_NUMBER'] # Your mobile phone number
    @delivery_time = (time.new + (60 * 60)).strftime("%k:%M")
  end
  
  def send_message
    @client.messages.create(
    from: @from,
    to: @to,
    body: "Thank you! Your order was placed and will be delivered before #{@delivery_time}"
    )
    "Confirmation Sent"
  end
end
