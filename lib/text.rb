require 'twilio-ruby'
class Text
  def initialize
    @account_sid = 'NEVERMIND that'
    @auth_token = 'Never Mind this'
  end

  def text_setup(from, to, body)
    client = Twilio::REST::Client.new(@account_sid, @auth_token)
    client.messages.create(
      from: from,
      to: to,
      body: body
    )
  end
end
