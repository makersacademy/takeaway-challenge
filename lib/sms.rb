require "twilio-ruby"

class SMS
  attr_reader :client, :config

  def initialize(config, client: nil)
    @client = client || 
    Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
    @config = config
    #not quite understand this part
    #had to rearrange for double client to accept 'messages'
  end

  def deliver
    client.messages.create(message_args)
    #not quite understand this part
  end

  private
  def message_args
    { from: config[:from],
    to: config[:to],
    body: config[:body] }
  end

  def delivery_time
    (Time.now + 60 * 60).strftime(TIME_FORMAT)
  end

end
