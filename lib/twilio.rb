require 'twilio-ruby'
require './info/info.rb'

class Phone
  include Phone_info
  attr_reader :client
  def initialize
    account_sid = get_account_sid
    auth_token = get_auth_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message(message)
    @client.api.account.messages.create(
      from: get_from_number,
      to: get_my_number,
      body: message
    )
  end
end
