
require 'twilio-ruby'
require 'dotenv'

class Text

  def send_text(number)
    confirmation(number)
  end

  def initialize
    account_sid = ENV["SID"]
    auth_token = ENV["AUTH"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def confirmation(number)

    @message = @client.account.messages.create(
    from:  "+441315102168",
    to: number,
    body: "Your order will arrive by #{(Time.now+3600).strftime("%H:%M")}"
    )
  end

end
