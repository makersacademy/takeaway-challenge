require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class SendSMS

    @friends = {ENV['friends_number'] => ENV['friends_name']}
    @SID = ENV['accountSID']
    @TOKEN = ENV['authTOKEN']
    @from = ENV['from']

time = Time.new

@client = Twilio::REST::Client.new @SID, @TOKEN

@friends.each do |key, value|
  message = @client.account.messages.create(
  :from => @from,
  :to => key,
  :body => "Thank you #{value}! Your order was placed and will be delivered before #{((Time.new) + (60 * 60)).strftime("%H:%M")}"
  )
 puts "confirmation has been sent"
 end
 end
