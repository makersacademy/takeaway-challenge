require 'twilio-ruby'
accountSTD = 'AC4688a00aafdf8777e77f5eb69c3e7d63'
authToken = '9b407c62910d792864428f45187f5352'

@client = Twilio::REST::Client.new accountSTD, authToken

from = '+441277424330'

friends = {'+447399822334' => "Elia"}

friends.each do |key, val|
  message = @client.account.message.create(
                         :from => from,
                         :to => key,
                         :body => "hey #{val}, there"

  )
  puts "send message to #{val}"
end
