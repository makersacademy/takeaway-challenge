require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Text

  def initialize (client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']))
    @client = client
  end

  def text_confirmation
    @client.messages.create(message)
  end

  def message
    { body: "Thank you! Your order was placed and will be delivered before #{time}",
      from: ENV['OUTGOING'],
      to: ENV['INCOMING']
    }
  end

  private

  def time
    Time.now + 3600
  end

end
