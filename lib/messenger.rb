require 'twilio-ruby'
require 'dotenv/load'

class Messenger

  attr_reader :client

  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send(confirmation)
    client.account.messages.create({
      to: ENV['TO_NUMBER'],
      from: ENV['FROM_NUMBER'],
      :body => confirmation + " WOOO!!!"})
    end

end
