require 'twilio-ruby'

account_sid = 'ACb240a03130d9e88e24f8a9ac0529b12c'
auth_token = 'cb612ed27a25cdff5214927fee3e3b0f'

client = Twilio::REST::Client.new account_sid, auth_token

delivery_time = Time.new + 1*60*60

client.messages.create(
  :from => '+447480824831',
  :to => '+447834348935',
  :body => "Thank you! Your order was placed and will be delivered before #{delivery_time.strftime("%H:%M")}")
