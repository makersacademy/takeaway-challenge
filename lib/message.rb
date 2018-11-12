require 'twilio-ruby'
require './ignore/info'

class Message
  attr_reader :client
  include Info

  def initialize
    account_sid = my_account_sid
    auth_token = my_auth_token
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send(content)
    @client.messages.create(
      body: content,
      to: test_to_number,
      from: test_from_number)
  end
end
