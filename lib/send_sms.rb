require 'twilio-ruby'

class Sms

  attr_reader :account_sid, :auth_token, :client, :from, :to

  def initialize
    @account_sid = 'ACeaf08799fdf07e04a450f4cbf303137f'
    @auth_token = '1e6b983cfda00aa789175faa8466309b'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
     @from = 'NUMBER OMITTED FOR PRIVACY' # Your Twilio number
    @to = 'NUMBER OMITTED FOR PRIVACY' # Your mobile phone number

  end
  def time
    temp = Time.new
    time = "#{temp.hour + 1}:#{temp.min}"
    return time
  end

  def sendMessage(order)
    @client.messages.create(
    from: @from,
    to: @to,
    body: "Order will arrive at #{time} \nTotal Paid: #{order}"
    )
  end
end
