require 'dotenv'
require 'twilio-ruby'

class Messenger
  attr_reader :sid, :auth, :from, :to

  def initialize
    @sid     = ENV['ACCOUNT_SID']
    @auth    = ENV['AUTH_TOKEN']
    @from    = ENV['FROM']
    @to      = ENV['TO']
    @twilio  = Twilio::REST::Client.new(sid, auth)
  end

  def send(text)
    @twilio.account.messages.create(from: from, to: to, body: text)
  end
end
