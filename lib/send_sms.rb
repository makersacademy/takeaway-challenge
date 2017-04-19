require 'twilio-ruby'

class SendSMS
accountSID = "AC702a6955b5b44f1a209e3d4cf3c8d7a0"
authTOKEN = "003482dc84266a1acf94496b18eee0e2"
time = Time.new

@client = Twilio::REST::Client.new accountSID, authTOKEN

from = '+441639262037'

friends = {'+447593707982' => 'Thady Condon'}

friends.each do |key, value|
  message = @client.account.messages.create(
  :from => from,
  :to => key,
  :body => "Thank you #{value}! Your order was placed and will be delivered before #{time.hour + 1}.#{time.min}"
  )
 puts "confirmation has been sent"
 end
 end
