require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Text

  def initialize(config = CONFIG_HASH, client: nil)
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
    @config = config
  end

  def send_text
    client.messages.create(message_args)
  end

  private

  attr_reader :client, :config

  CONFIG_HASH = {
      account_sid: ENV['TWILIO_ACCOUNT_SID'],
      auth_token: ENV['TWILIO_AUTH_TOKEN'],
      from: ENV['TWILIO_NUMBER'],
      to: ENV['MY_NUMBER'],
      body: "Thank you! Your order will be delivered before "
    }

  def message_args
    {
      from: config[:from],
      to: config[:to],
      body: config[:body] + delivery_time
    }
  end

  def delivery_time
    (Time.now+(60*60)).strftime('%r')
  end
end



