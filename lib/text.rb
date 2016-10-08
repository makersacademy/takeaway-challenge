require 'sinatra'
require 'twilio-ruby'

class Text

  def send_message(message)
    account_sid = 'ACc640281be37f4406d87815bf22bc7d33'
    auth_token = '8d4fec8704977e0cf1551088fe6c4a3f'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => '+441143032484',
      :to => '+447857134614',
      :body => "#{message}",
      })
  end

end
