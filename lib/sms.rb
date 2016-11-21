require 'twilio-ruby'
require 'dotenv'

Dotenv.load

class SMS

  def send_sms(message)

    account_sid = ENV[ACCOUNT_SID]
    auth_token = ENV[AUTH_TOKEN]

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
      :from => '+442033224884',
      :to => ENV[NUMBER],
      :body => message
    )

  end

end
