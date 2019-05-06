require "./lib/text.rb"
require("bundler")
Bundler.require()

class SendSMS
  def initialize
    @account_sid = "ACb4566e2ff2f108e9705aff97af967eca"
    @auth_token = "620471e00f3a455761d098cc9d91dfb5"
  end

  def send
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @message = Text.new.generate
    @client.messages.create(
      to: "+447507093700",
      from: "+441499377023",
      body: @message
    )
  end

end
