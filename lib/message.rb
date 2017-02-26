require 'twilio-ruby'


accountSID = 'ACd46c2d4277327ad9014d8e9b3a16a9b9'
authToken = '5a9ab4edfcba1c5f111a502df2312228'

@client = Twilio::REST::Client.new accountSID, authToken

from = '+441315103569'

customer = { '+447595939340' => "Albert Yanit" }

customer.each do |key, value|
  message = @client.account.messages.create(
                                        :from => from,
                                        :to => key,
                                        :body =>
  )
  puts "Sent message to #{value}"
end
