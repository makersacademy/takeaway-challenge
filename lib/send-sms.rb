require "bundler"
require 'twilio-ruby'
Bundler.require()
class Sendmessage

  def initialize
    @account_sid = ENV['SID']
    @auth_token =  ENV['TOKEN']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send_message(recieving_number)
    @time = Time.now
    @time += 3600
    @time = @time.strftime("%H:%M%p")
    message = "Your order has been processed and is expected to arrive by: #{@time}"
    @client.messages.create(
      to: recieving_number,
      from: ENV['PHONE_NUM'],
      body: message
    )
      
  end 

end
