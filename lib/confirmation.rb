require 'twilio-ruby'

class Confirmation
  
  attr_reader :client, :config

  def initialize(config, client: nil)
    @config = config
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
  end
  
  def deliver
    client.messages.create(confirmation_text)
  end
  
  def confirmation_text
    {
    body: config[:body] % delivery_time,
    to: config[:to],
    from: config[:from]
    }
  end

  def delivery_time
    (Time.now + 60 * 60).strftime("%H:%M")
  end

end