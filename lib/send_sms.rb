require 'twilio-ruby'
require 'dotenv/load'

class Text

  def send_text

    account_sid = 'ACf5c84732026c873fc5c400378d3669b9'
    auth_token = '3ced2f5e908746f0b249072b52f7b790'
      @client = Twilio::REST::Client.new account_sid, auth_token

      @client.api.account.messages.create(
        from: '+441634540203',
        to: '+447586450998',
        body: "Thank you! Your order was placed and will be delivered before #{eta}"
      )
  end

  def eta
    time = (Time.now) + 3600
    time.strftime("%H:%M")
  end


end
