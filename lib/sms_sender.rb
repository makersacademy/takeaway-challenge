require 'twilio-ruby'

class SmsSender

  def send(message)
    account_sid = 'AC3ded645e335f955868d2d72e389f7549'
    auth_token = 'b47327303937ab93646bcc3343042a8e'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
      :from => '+4915735987696',
      :to => '+4915115734729',
      :body => message
    })
  end
end
