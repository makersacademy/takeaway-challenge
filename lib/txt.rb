# require 'rubygems'
# require 'twilio-ruby'
# account_sid = 'AC5ef872f6da5a21de157d80997a64bd33'
# auth_token = '6499a105e497a9e20c0f1ca04f3585e8'
# @client = Twilio::REST::Client.new account_sid, auth_token
# @client.account.messages.create({
#   :from => '+14158141829',
#   :to => '+447527171858',
#   :body => 'Thank you! Your order was placed and will be delivered soon'
# })

require 'rubygems'
require 'twilio-ruby'

account_sid = "AC2758f395eb1c415c7085d627fe24f339"
auth_token = "6499a105e497a9e20c0f1ca04f3585e8"

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Thank you! Your order was placed and will be delivered soon",
    to: "+447527171858",
    from: "+15005550006")

puts message.sid
puts message.body
