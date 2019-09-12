require 'twilio-ruby'
class TextMessage

  def initialize
    @account_sid = ENV['TWILIOSID']
    @auth_token = ENV['TWILIOAUTH']
  end

  def send_text(message = "dummy text")
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    @client.api.account.messages.create(
      from: '+441452260429',
      to: '+447788675323',
      body: message
    )
    true
  end
end
