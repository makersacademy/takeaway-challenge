# not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class SMS

  # set up a client to talk to the Twilio REST API
  def initialize client = (Twilio::REST::Client.new ENV['SID'], ENV['AUTH'])
    @client = client
    @time = (Time.new + 3600).strftime("%I:%M%p")
  end

  def send message
    @client.account.messages.create({
    	:from => ENV['TWIL_NUM'],
    	:to => ENV['MY_NUM'],
    	:body => "#{message}\n Will be delivered at: #{@time}",
    })
  end

end
