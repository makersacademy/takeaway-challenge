require "twilio-ruby"

class TextMessage
  attr_reader :client, :config

  TIME_FORMAT = "%H:%M"

  def initialize(config, client: nil)
    @config = config
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
  end

  def deliver
    client.messages.create(message_args)
  end

  def message_args
    {
      from: config[:from],
      to: config[:to],
      body: config[:body] % delivery_time
    }
  end

  def delivery_time
    (Time.now + (60 * 60)).strftime(TIME_FORMAT)
  end
end
