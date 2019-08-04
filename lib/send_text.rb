#require 'twilio-ruby'

class SendTxt
  def initialize
    @account_sid = 'AC2f9bef5319a6066076b685d1db62a2e2'
    @auth_token = 'feb43126d3217169e0024178a1cf43dc'
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_txt(text_body)
    @client.api.account.messages.create(
      from: '+441143031790',
      to: '+447545258817',
      body: text_body
    )
  end

end
