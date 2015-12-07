
require 'twilio-ruby'
require 'dotenv'

class Text

  def initialize
    @client = Twilio::REST::Client.new ENV["SID"], ENV["AUTH"]
  end

  def send_text(number)
    @client.account.messages.create(
    from:  "+441315102168",
    to: number,
    body: "Your order will arrive by #{(Time.now+3600).strftime("%H:%M")}"
    )
  end

end
