require 'twilio-ruby'
class Text
  def initialize
    @account_sid = 'AC73cfaccaa30239daf42048747583f72e'
    @auth_token = '14b5f371e89b1e63e1eba10d10097b70'
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