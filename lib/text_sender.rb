require 'twilio-ruby'
require_relative '../.env.rb'

class TextSender

  attr_reader :sender, :client

  def initialize
    @sender = "441496877050"
    @client = Twilio::REST::Client.new(ENV[:account_sid], ENV[:auth_token])
  end

  def send_text to, body
    @client.account.messages.create(
      body: body,
      to: to,
      from: sender,
      via: client)
  end
  
end
