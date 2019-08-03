
require 'twilio-ruby'
class SMS

  TIME = "%H:%M"

  def initialize(config,client: nil)
    @config = config
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
  end

  def deliver
    client.messages.create(message_info)
  end

  private

  attr_reader :client, :config

  def message_info
    {
      from: config[:from],
      to: config[:to],
      body: config[:body] % delivery_time

    }
  end

  def delivery_time
    (Time.now + 60 * 60).strftime(TIME)
  end

end