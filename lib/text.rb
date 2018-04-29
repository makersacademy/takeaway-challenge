require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACeb9beae177f3407cbc57f3cbf7f7030f'
auth_token = '15bc44433ebe4b3abd034be2c1d30647'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token
  current_time = (Time.new).strftime("%H:%M")
  in_hour = (Time.new + 3600).strftime("%H:%M")

@client.api.account.messages.create(
  from: '+441138591406',
  to: '+447853403172',
  body: "Thank you for your order placed at #{current_time}. Your order will be with you at #{in_hour}"
)

puts 'Sent message'
