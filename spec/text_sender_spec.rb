require 'text_sender'
require 'twilio-ruby'

describe TextSender do

@client = Twilio::REST::Client.new(ENV[account_sid], ENV[auth_token])

@client.account.messages.create(from: "441322721396", to: "447963648096", body: "Hey future Simon!")

end