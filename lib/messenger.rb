require 'twilio-ruby'

class Messenger

  def initialize
    # put your own credentials here
    account_sid = 'ACccf307f4d525ffd8e4573774252206eb'
    auth_token = '887ceae2323916a92c1eae0b97a4980d'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms(message)
    @client.api.account.messages.create(
      from: '+441482240601',
      to: '+447825178166',
      body: message
    )
  end

end
