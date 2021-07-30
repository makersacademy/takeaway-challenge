require 'twilio-ruby'
t = Time.new
class Messenger
  def initialize()
    @account_sid = 'AC7eb4c60d8a372ab63e77be664aeba3ea'
    @auth_token = '7a01139e91c8240549cfe28a0eeecfd6'
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
