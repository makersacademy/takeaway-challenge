require 'twilio-ruby'

class TwilioAdapter

  def initialize
    account_sid = 
    auth_token = 
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  # def message
  #   @client.messages.create(
  #     from: ,
  #     to: ,
  #     body: 
  #   )
  # end

end