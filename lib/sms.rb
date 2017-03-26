require 'twilio-ruby'
require_relative 'sms_config'
# Sends SMS to customer to confirm order
class SMS

  def initialize(config = Config.new.config)
    @config = config
    @client = Twilio::REST::Client.new(config[:account_sid],config[:auth_token])
  end

  def send
    client.messages.create(
    from: config[:from],
    to: config[:to],
    body: "Thank you, loyal customer! Your order has been successfully placed.\nEstimated Delivery Time: #{Time.now + (60*60)}"
    )
  end

  private
  attr_reader :client, :config

end
