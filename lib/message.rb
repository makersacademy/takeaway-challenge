require 'twilio-ruby'

class Message
  def initialize(dishes, total)
    @dishes = dishes
    @total = total
  end

  def send_message
    # put your own credentials here
    account_sid = 'ACed96b99711572b679b1de63c73fa870b'
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
    	:from => '+441652462019',
    	:to => ENV['PHONENUMBER'],
    	:body => "The following items: #{@dishes}, price: #{@total} will arrive at #{Time.now + 3600}",
    })
  end

end
