require 'twilio-ruby'

class Messenger
  def create( from, to, body)
    account_sid = 'AC89d950d129482b828259244e80366b30'
    auth_token = ''
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => from,
      :to => to,
      :body => body,
    })
  end
end