require 'twilio-ruby'
class Messager

  TIME_FORMAT = "%H:%M"

  def initialize(msg_config)
    @client = Twilio::REST::Client.new(msg_config[:account_sid], msg_config[:auth_token])
    @msg_config = msg_config
  end

  def send_confirmation_msg
    @client.messages.create(message_args)
  end

  private

  attr_reader :message_args, :client, :msg_config

  def message_args
    {
      body: @msg_config[:body] + updated_delivery_time,
			to: @msg_config[:to],
      from: @msg_config[:from]
    }
  end

  def updated_delivery_time
    delivery_time = Time.now + 3600
    delivery_time.strftime(TIME_FORMAT)
  end

end
