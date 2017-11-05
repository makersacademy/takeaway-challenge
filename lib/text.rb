require 'twilio-ruby'

class Text

  def message(total)
    account_sid = 'AC3c71befe920149156f8940e80ea10387'
    auth_token = 'aabc550b04e117a921ffa8c4c4ad0357'

    client = Twilio::REST::Client.new(account_sid, auth_token)
    time = Time.new.strftime "%H:%M"
    client.messages.create(
      from: '+442033222694',
      to: '+447561483699',
      body: "Thank you! Your order was placed at #{time} amounting to £#{total} and will be delivered within an hour!"
    )
  end

end
