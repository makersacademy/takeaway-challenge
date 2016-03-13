require 'rubygems'
require 'twilio-ruby'

account_sid = 'AC5ef872f6da5a21de157d80997a64bd33'
auth_token = '[AuthToken]'


@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
  :from => '+14158141829',
  :to => '+16518675309',
  :body => "Thank you! Your order was placed and will be delivered before #{(Time.now + (60*60)).strftime('%H:%M')}",  
})
