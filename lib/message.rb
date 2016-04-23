require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Message
  def initialize(del_time)
    @del_time = del_time
  end

  def send
    # put your own credentials here
    account_sid = ENV['TWIL_SID']
    auth_token = ENV['TWIL_AUTH']

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
    	from: ENV['FROM_PHONE'],
    	to: ENV['TO_PHONE'],
    	body: "Thank you for your order, "\
      "It will be delivered by #{@del_time}"
    )
  end
end
