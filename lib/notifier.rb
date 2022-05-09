require 'twilio-ruby'

class Notifier

    def send_message(confirmation)
# put your own credentials here
account_sid = 'ACc506b8f205b6186bfb7bd7b632166ba2'
auth_token = '1589f42120cde934f4aceecd8c4dd424'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.messages.create(
    from: '+12075608882',
    to: '+447591959133',
    body: confirmation
  )
  return confirmation
    end
end