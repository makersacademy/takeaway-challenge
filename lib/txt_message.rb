require 'rubygems'
require 'twilio-ruby'

class MessagingService

  ACCOUNT_SID = 'AC4643f4df89b3db7d2a970f554fb7b986'
  AUTH_TOKEN = 'fe29e4844710cde179f5ab7ce290542f'

  def create_twilio_client
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  end

  def send_message(user_message)
    message = create_twilio_client.messages.create({
      :from => '+441315102426',
      :to => '+447931741021',
      :body => user_message
    })
    message.status
  end

end
