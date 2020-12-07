require "twilio-ruby"

class SMS

  attr_reader :client, :config
 
  def initialize(config, client: nil)
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
    @config = config
    end

  def send
    client.messages.create(messages_args)
  end

  def messages_args
    { 
      from: config[:from],
      to: config[:to],
      body: config[:body] % delivery_time 
    }
  end

  def delivery_time
    (Time.now + 60 * 60).strftime("%H:%M")
  end

end
