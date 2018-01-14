require 'rubygems'
require 'twilio-ruby'
class Texter
  def initialize
    environment
  end

  def send(message)
    client = Twilio::REST::Client.new @account_sid, @auth_token
    client.messages.create(from: @from, to: @to, body: message)
    puts "Message sent to #{@to}"
  end

  private
  def environment
    @from = ENV["from"]
    @account_sid = ENV["account_sid"]
    @auth_token = ENV["auth_token"]
    @to = ENV["to"]
  end
end
