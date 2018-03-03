require 'twilio-ruby'

class Text

  def initialize
    @account_sid = 'ACdc1d2bbaebcecbf133093e7387b76d1c'
    @auth_token = '0f4ce255fb1eb99f97a6ad1cbb3a3201'
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @client.messages.create(
      to: "+447538712782",
      from: "+447480589987",
      body: "Your order will be with you in 45 minutes!"
    )
  end
end
