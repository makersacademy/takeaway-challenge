require 'twilio-ruby'

private
module SMS
  def send_sms(_message)
    account_sid = "AC5e9caa7cfc49df6c213aab630094cdd8"
    auth_token = "4b0ac2496f41c859530ea0fe8058ebf1"
    @client = Twilio::REST::Client.new account_sid, auth_token
    from = "+44 113 320 5206"
    @client.account.messages.create(
      from: from,
      to: @user,
      body: "Thank you for your order"
    )
    puts "Your order has been placed, a confirmation text has been sent"
  end
end
