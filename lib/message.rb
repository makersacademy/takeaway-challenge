require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Message
  def initialize(del_time)
    @del_time = del_time
  end

  def send
    @client = Twilio::REST::Client.new ENV['TWIL_SID'], ENV['TWIL_AUTH']
    @client.account.messages.create(
    	from: ENV['FROM_PHONE'],
    	to: ENV['TO_PHONE'],
    	body: "Thank you for your order, "\
      "It will be delivered by #{@del_time}"
    )
  end
end
