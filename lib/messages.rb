# require 'rubygems'
# require 'twilio-ruby'

class Messages
  require 'twilio-ruby'
  SID = "AC28311533392e3cb81b6417d38bca4554".freeze
  TOKEN = "7da5ff9f79b81398aa379e1e24340c6a".freeze
  def initialize(from = "+16572206632", account_sid = SID, auth_token = TOKEN)
    @client = Twilio::REST::Client.new account_sid, auth_token
    @from =  from# Your Twilio number
    current = Time.now
    @t = format('%d:%02d', current.hour + 1, current.min)
    @friends = {
    +1_562_631_7216 => "Nick"
    }
  end

  def send_message
    m = "Thank you! Your order was placed and will be delivered before #{@t}"
    @friends.each do |key, value|
      @client.account.messages.create(
        from: @from,
        to: key,
        body: m
      )
      puts "Sent message to #{value}"
    end
  end
end
