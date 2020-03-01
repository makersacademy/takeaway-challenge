require "twilio-ruby"

class SMS

  TIME_FORMAT = "%H:%M"
  def initialize(config, client: nil)
    # if we inject the configuration in we can have the configuration hash
    # be responsible for telling the sms to send things
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
    # this  means that in our spec we can create a config file that defines these things
    @config = config
  end

  def deliver
    client.messages.create(message_args)
  end

  private

  attr_reader :client, :config

  def message_args
    {
      from: config[:from],
      to: config[:to],
      body: config[:body] % delivery_time
    }
  end

  def delivery_time
    # strftime aka string readable format
    (Time.now + 60 * 60).strftime(TIME_FORMAT)
  end
end
