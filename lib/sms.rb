require "twilio-ruby"

class SMS
  attr_reader :client, :config

  def initialize(config, client = nil)
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
    @config = config 
  end 

  def deliver
    client.messages.create(message_args)
  end

  private
  def message_args
    {
    from: config[:from],
    to: config[:to],
    body: config[:body] 
    }

  end 

end
