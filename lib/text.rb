require 'twilio-ruby'

class Text

  def message(total)
    account_sid = 'xxx'
    auth_token = 'dfd'
    client = Twilio::REST::Client.new(account_sid, auth_token)
    time = Time.new.strftime "%H:%M"
    client.messages.create(
      from: '+442033222694',
      to: '+447561483699',
      body: "Thank you! Your order was placed at #{time} amounting to £#{total} and will be delivered within an hour!"
    )
  end

end
