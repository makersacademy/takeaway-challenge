Class Messenger

  require 'twilio-ruby'

  account_sid = 'AC262a701eeb958baf610a7799e425a693'
  auth_token = 'd9a2db1879648e2d871724b15eaf9015'

  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.messages.create({
    :from => '+441698313049',
    :to => '+447731933555',
    :body => 'This is the ship that made the Kessel Run in fourteen parsecs?',
  })

end
