require 'rubygems'
require 'twilio-ruby'

class Text

  def send_text
    account_sid = 'AC5216a758166a70bf403c0e4069fa51d4'
    auth_token = '3a653dabdb02ba9ca3e61326d7f42bc8'

    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.account.messages.create( {
      :from => '+441202286542',
      :to => '+4407465976165',
      :body => 'Thanks for ordering'
    } )
  end

end
