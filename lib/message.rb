require 'twilio-ruby'

class Message

  def send
    t = Time.new
    account_sid = 'ACdc30fd763b7189fbe5be0bee1814cfec'
    auth_token = '24ac22eb0cc8f5d9e61c0360fba47474'
    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.account.messages.create(
        to:    "+447502429477",
        from:  "+441494372448",
        body:  "Thank you! Your order was placed and will be delivered before #{t.hour + 1}:#{t.min}"
        )
  end
  #puts message.sid
end
