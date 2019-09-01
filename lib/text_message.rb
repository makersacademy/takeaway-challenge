require 'twilio-ruby'
class TextMessage

  def initialize
    @account_sid = 'AC99fc241dd551f1c018368d1d3e15b0f5'
    @auth_token = 'ab701f34dadd210e6ae0255d3adb7eaf'
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
