require 'twilio-ruby'
require_relative '../.env.rb'

class Text

  attr_reader :customer_number

  def self.make_text (customer_number, message )
    our_number = '+441484906157'
    account_sid = ENV[:account_sid]
    auth_token = ENV[:auth_token]
    client = Twilio::REST::Client.new account_sid, auth_token
    client.account.messages.create({
    	:from => our_number,
    	:to => customer_number,
    	:body => message,
    })
    true
  end
end
