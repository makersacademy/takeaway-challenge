require 'twilio-ruby'
require 'dotenv'

class Text

  def send_text

    Dotenv.load
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
      @client = Twilio::REST::Client.new account_sid, auth_token

      @client.api.account.messages.create(
        from: ENV['FROM'],
        to: ENV['TO'],
        body: "Thank you! Your order was placed and will be delivered before #{eta}"
      )
  end

  def eta
    time = (Time.now) + 3600
    time.strftime("%H:%M")
  end


end
