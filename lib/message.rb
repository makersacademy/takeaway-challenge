require 'twilio-ruby'
require './ignore/info.rb'

class Message
  attr_reader :client

  def initialize(client_class = Twilio::REST::Client, info = Info.new)
    @info = info
    @client = client_class.new(@info.my_account_sid, @info.my_auth_token)
  end

  def send(content)
    @client.messages.create({
      body: content,
      to: @info.test_to_number,
      from: @info.test_from_number })
  end
end
