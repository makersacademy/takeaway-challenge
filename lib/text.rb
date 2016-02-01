require 'dotenv'
require 'twilio-ruby'

class Text

  def initialize
    @credentials = Dotenv.load
  end

  def send_text(total)
    account_sid = @credentials["ACCOUNT_SID"]
    auth_token = @credentials["AUTH_TOKEN"]

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
    	:from => '+441772367478',
    	:to => @credentials['MOB'],
      :body => "Thanks for your order! Your total is £#{total}, your food will be delivered by #{time.strftime("%H:%M")}"
    })
  end

  def time
    @time = Time.new + 3600
  end

end
