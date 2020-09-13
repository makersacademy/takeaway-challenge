require 'twilio-ruby'

def initialize
account_sid = ENV["TWILIO_ACCOUNT_SID"]
auth_token = ENV["TWILIO_AUTH_TOKEN"]
@client = Twilio::REST::Client.new(account_sid, auth_token)
end

#def send_text

@client.messages.create(
    to: ENV["MY_PHONE_NUMBER"],
    from: "+447429925677",
    body: "Test receive SMS"
)

#end


