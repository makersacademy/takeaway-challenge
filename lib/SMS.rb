require 'twilio-ruby'

class SMS

    TIME_FORMAT = '%H:%M'

  #attr_reader :client, :config

  def initialize(config, client: nil)
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
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
    (Time.now + 60 * 60).strftime(TIME_FORMAT)
  end
end 
