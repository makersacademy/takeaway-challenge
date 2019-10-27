
require 'twilio-ruby'

class TextSender

  def initialize
    @account_sid = 'ACb49f9d0bddd850c0bf2b56982167b15c'
    @auth_token = '33d1c3f3ecf051d17d371a49425961fc'
  end

  def send(message = "a text")
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    @client.api.account.messages.create(
      from: '++441665252041',
      to: '+447738053947',
      body: message
    )
    true
  end
end
