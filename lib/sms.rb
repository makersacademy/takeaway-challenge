require 'twilio-ruby'

class SMS

  TIME_FORMAT = "%H:%M"

  CONFIG =
    { account_sid: "AC1a757e2dd73b62efcbb52def2d72432d",
      auth_token: "e83f862f205340368bfb1e7a17c3e4c1",
      from: "+441443606449",
      to: "+447783980181",
      body: "Thank you! Your order was placed and will be delivered before %s"
    }

  def initialize(config = CONFIG, client: nil)
    @client = client || Twilio::REST::Client.new(config[:account_sid],
    config[:auth_token])
    @config = config
  end

  def send
    client.messages.create(arguments)
    puts "Confirmation SMS has been sent to the client"
  end

  private

  attr_reader :client, :config

  def arguments
    {
      from: config[:from],
      to: config[:to],
      body: config[:body] % delivery_time
    }
  end

  def delivery_time
    (Time.now + (60*60)).strftime(TIME_FORMAT)
  end

end
