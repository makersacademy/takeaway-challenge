require 'twilio-ruby'

class MessageSender

  Client = Twilio::REST::Client

  attr_accessor :Client, :client

  def initialize
    @client = Client.new(
      ENV.fetch("TWILLIO_ACCOUNT_SID"),
      ENV.fetch("TWILLIO_AUTH_TOKEN"))
    end

  def send_message(from, to, body )
    @client.messages.create(from: from, to: to, body: body)
  end

end
