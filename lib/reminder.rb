require 'twilio-ruby'

class Reminder

  def send_msg(text)

    @account_sid = 'ACXXXXXXXXXXXX'
    @auth_token  = '0XXXXXXXXXXXXX'
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)

    @client.messages.create(
    from: '+441412804523',
    to:   '+447810968754',
    body: text)

  end

end
