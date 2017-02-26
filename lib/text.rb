
require 'twilio-ruby'
class Text
  attr_reader :client, :file
  def initialize(client, file)
    @client = client || Tiwilio::REST::Client.new(file[:account_sid], file[:auth_token])
    @file = file
  end
  def args
    {
      from: file[:from],
      to: file[:to],
      body: file[:body] % (Time.now + 60*60).strftime("%H:%M")
    }

  end

  def deliver_text
    client.messages.create(args)
  end
end # => class Text
