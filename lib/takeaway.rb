class Takeaway
  def initialize
    @message = []
  end
  
  def notification(deliver)
    @message << "Thank you! Your order was placed on #{Time.now.strftime("%d/%m/%Y %H:%M")} and will be delivered before #{(Time.now + 1 * 60 * 60).strftime("%H:%M")}"
    @message << "Items ordered:"
    i = 0
    deliver.order.each { |item| @message << "#{i += 1}: #{item.keys.join}, Price: £#{item.values.join}" }
    @message << "Total: £#{deliver.total}"
    puts deliver.customer_details.last # push SMS to number >>
    puts @message.join("\n") # push SMS messagee >>
  end
end

=begin
### Send SMS >>>>

require 'rubygems'
require 'twilio-ruby'

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages
  .create(
     body: '@message.join("\n")',
     from: 'Plants Power',
     to: 'deliver.customer_details.last'
   )

puts message.sid
=end
