require 'twilio-ruby'

module SendSms
  def send_text(body)
    account_sid = 'ACf7689020829b6d37eb7efb1262ab9f40'
    auth_token = 'c1877557e592e48ae2456ee1d072f89e'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.messages.create(
      to: "+447463901307",
      from: "+441438300260",
      body: body
    )
  end
end
