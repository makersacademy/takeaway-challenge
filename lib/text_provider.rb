require "twilio-ruby"

class TextProvider

  TIME_FORMAT = "%H:%M"

  def initialize(config, client = nil)
    new_cl = Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
    self.client = client || new_cl
    self.config = config
  end

  def deliver
    client.messages.create(message_args)
  end

  private

  attr_accessor :client, :config

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
