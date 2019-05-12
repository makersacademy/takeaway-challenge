require 'twilio-ruby'
require_relative 'message_service_config'

class MessageService
  def initialize(config)
    @config = config
    @client = Twilio::REST::Client.new(config.account_sid, config.auth_token)
  end

  def send_message(message)
    @client.messages.create(
      from: @config.from,
      to: @config.to,
      body: message)
  end
end
