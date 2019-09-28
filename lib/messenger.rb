require 'twilio-ruby'

class Messenger
  def initialize
    @client = Twilio::REST::Client.new(account_sid, auth_token)

  end

  account_sid = 'AC6bb6cec88701e8c95afc020b7a6640b3'
  auth_token = 'your_auth_token'

  message = @client.messages
  .create(
     body: 'Phantom Menace was clearly the best of the prequel trilogy.',
     messaging_service_sid: 'MG9752274e9e519418a7406176694466fa',
     to: '+441632960675'
  )
end