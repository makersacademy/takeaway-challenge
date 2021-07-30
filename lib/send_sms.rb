require 'twilio-ruby'
t = Time.new
class Messenger
  def initialize()
    @account_sid = ''
    @auth_token = ''
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)

    @from = '+447445034137' # Your Twilio number
    @to = '' # Your mobile phone number
  end

  def send
    @client.messages.create(
    from: @from,
    to: @to,
    body: "Order Placed 🍲🤯"
    )
  end
end
