require 'twilio-ruby'
require 'dotenv/load'

account_sid = "ACf57fe993220533543d389c7c17d3398c"
auth_token = "8ad60fc96d300a9a9214f353d1404aeb"

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+447794991782",    # Replace with your phone number
    from: "+441984250049")  # Replace with your Twilio number

puts message.sid
puts @client.http_client.last_response.status_code
