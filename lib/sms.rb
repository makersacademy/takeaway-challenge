require 'twilio-ruby'

module Sms

  attr_reader :account_sid, :auth_token

account_sid = 'AC933d8659217bc426a9f250b8ecc47d79'
auth_token = '7748beb388e4a6b2e5f5a17b70dd1c62'

@client = Twilio::REST::Client.new(account_sid, auth_token)

def self.text(number)
  @client.messages.create(
  from: '+441173255479',
  to: number,
  body: "You have ordered successfully!"
  )
end

private

attr_writer :account_sid, :auth_token

end
