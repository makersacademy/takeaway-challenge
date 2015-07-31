class TextSender
	attr_reader :client, :message, :sender, :receiver
	
  def initialize
		@message = message
		@sender = from
		@receiver = to
    @client = via
	end

	def self.call message:, from:, to:, via:
		new(message: message, from: from, to: to, via: via)
	end

  def send_message
    client.messages.create(
      to: receiver.number,
      from: sender.number,
      body: "#{message}, #{receiver} #{sender} #{client}",
      )
  end
end