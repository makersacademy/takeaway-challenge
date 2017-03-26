require 'twilio-ruby'

account_sid = 'AC0c20791b57048ba5c24cfa1d05a52a59'
auth_token = 'd7b307c5d1866ecf46228e35a13cc527'

@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create(
  from: '+441202237841',
  to: '+447717022447',
  body: 'Robot invasion! Reply back with any sightings.'
)



# twilio number +441202237841
# account_sid = AC0c20791b57048ba5c24cfa1d05a52a59
# auth_token = d7b307c5d1866ecf46228e35a13cc527
