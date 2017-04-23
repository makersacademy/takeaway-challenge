
require 'twilio-ruby'
require_relative 'total'

class Text
  attr_reader :total

  def send

    t = Time.new + 7200
    @dt = t.strftime('%R')

    account_sid = 'AC665d861428c00e93175249a7481dd242'
    auth_token = 'f9bf3cef805d86413e93b7f3f5c8e0a8'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.messages.create(
      to: "+447749747490",
      from: "+441659432021",
      body: "Your food will be delivered by #{@dt}. Your bill is £#{$total}0"
    )
    exit
  end
end
