require 'rubygems'
require 'twilio-ruby'
require 'time'

class Sendsms

  def initialize
    account_sid = 'AC69cef69991d1c8e42e3bfff281157e71'
    auth_token = 'ec63982659c577e36ee530ea9e604093'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_confirmation
    arr = []
    time = Time.now
    time += 3600
    formatted_time = arr.push(time).join('').slice!(0, 19)
    
    @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before
      #{formatted_time}",
      from: '+441922214593',
      to: '+447446966284'
    )
  end
end
