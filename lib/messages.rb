# require 'rubygems'
# require 'twilio-ruby'

class Messages
  require 'twilio-ruby'
  SID = "AC28311533392e3cb81b6417d38bca4554"
  TOKEN = "7da5ff9f79b81398aa379e1e24340c6a"
  def initialize(from = "+16572206632", account_sid = SID, auth_token = TOKEN)
    @client = Twilio::REST::Client.new account_sid, auth_token
    @from =  from# Your Twilio number
    current = Time.now
    @t = "#{current.hour + 1}:#{'%02d' % current.min}"
    @friends = {
    +15626317216 => "Nick"
    }
  end

  def send_message
    @friends.each do |key, value|
      @client.account.messages.create(
        :from => @from,
        :to => key,
        :body => "Thank you! Your order was placed and will be delivered before #{@t}"
      )
      puts "Sent message to #{value}"
    end
  end
end
