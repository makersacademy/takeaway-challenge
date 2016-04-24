require 'twilio-ruby'
TIME = "%H:%M"
class Messenger
 attr_reader :config, :client
  def initialize (config, client: nil)
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
    @config = config
  end

  def send
    client.messages.create(message_data)
  end

private

  def message_data
    {from: config[:from], to: config[:to],
        body: config[:body] % delivery_time}
  end

  def delivery_time
    (Time.new + 3600).strftime TIME
  end
end
