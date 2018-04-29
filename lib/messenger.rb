require 'rubygems'
require 'twilio-ruby'

class Messenger

  attr_reader :client, :from, :to

  def initialize
    account_sid = 'AC01aa9b404e2ab9272a6241a266d7c734'
    auth_token = 'ab3dc923b7c2882085ed58a5e4746ca7'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @from = '+441654720032'
    @to = '+447891721675'
  end

  def message
    time = (Time.now + 60 * 60).strftime("%H:%M")
    @client.messages.create(
    from: from,
    to: to,
    body: "Thanks for your order. It should arrive before #{time}."
    )
  end

end
