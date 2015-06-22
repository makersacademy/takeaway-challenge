require 'twilio-ruby'

class TextOrder

  attr_reader :client, :message, :sender, :receiver

  def initialize(message:, from:, to:, via:)
    @message  = message
    @sender   = from
    @receiver = to
    @client   = via
  end

  def self.call(message:, from:, to:, via:)
    new(message: message, from: from, to: to, via: via).send_message
  end

  def send_message
    client.messages.create(
    from: sender.number,
    to: receiver.number,
    body: "#{message}, #{receiver.name}"
    )
  end

end
