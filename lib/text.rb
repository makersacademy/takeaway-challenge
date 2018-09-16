require 'twilio-ruby'

class Text

  def send_text

    account_sid = "ACedb6236ce3d2430fc5fe8274639ece3a"
    auth_token = "e859e42a519bf5931ddea8627dc1bcfb"
    client = Twilio::REST::Client.new(account_sid, auth_token)
    time = Time.now + 3600
    client.messages.create(
    from: "+441274271947",
    to: "+447504745676",
    body: "Thank you! Your order was placed and will be delivered before #{time}"
    )
    "Text sent"
    end

end
