require 'twilio-ruby'
require 'dotenv/load'

class Text 
  
  def initialize(client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']))
    @client = client
  end

  def send
    @client.messages.create(generate_message)
  end

  def generate_message
    { from: ENV['SENDING_NUM'],
      to: ENV['RECEIVING_NUM'],
      body: "Thank you! Your order was placed and will be delivered before #{time}"
    }
  end

  def time
    (Time.now + 3600).strftime('%H:%M')
  end
end


