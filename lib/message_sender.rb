# Class with Twilio REST API client to send text message
require 'twilio-ruby'
require './lib/info.rb'

class MessageSender

  def self.send_message(order_id, to, message)
    new.send_message(order_id, to, message)
  end

  def initialize
      account_sid = Information::SID
      auth_token = Information::TOKEN
      @client = Twilio::REST::Client.new(account_sid, auth_token)
    end

  def send_message(order_id, to, message)
      @client.account.messages.create(
      from: Information::FROM,
      to: to,
      body: message,
      )
    end


end
