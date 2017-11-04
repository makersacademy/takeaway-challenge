require 'twilio-ruby'
require 'sinatra'
require_relative 'credentials'

class TextOrder

  def initialize
    @account_sid = SID
    @auth_token = TOKEN
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @messages = []
  end

  def send_text(message, client = TO)
    @messages << @client.messages.create(
                  from: FROM,
                  to: client,
                  body: message
                  )
    puts @messages.last.status
    return 
  end

end
