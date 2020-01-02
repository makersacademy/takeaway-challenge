require 'twilio-ruby'

class Message
  
  def initialize
    account_sid = 'AC599dd0a825b9e714d06f7770f9e575e8'
    auth_token = '9821eb159db1f44bb4a4ba25c1c8cf2c'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_text(message)
    # this method calls the Twilio API
    @client.messages.create(
      body: message,
      from: '+441946372062',
      to: '+447842819857'
    )
  end

end
