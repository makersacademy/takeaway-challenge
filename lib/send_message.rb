require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class SendMessage

  def send_sms(total)
    # put your own credentials here
    account_sid = ENV['account_sid']
    auth_token = ENV['auth_token']

    #output time from 1 hour from now
    @time = (Time.now + (60*60)).strftime("%H:%M")

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    # alternatively, you can preconfigure the client like so
    Twilio.configure do |config|
      config.account_sid = account_sid
      config.auth_token = auth_token
    end

    # and then you can create a new client without parameters
    @client = Twilio::REST::Client.new

    @client.messages.create(
    from: ENV['from'],
    to: ENV['to'],
    body: "Thank you! Your order was placed and will be delivered before #{@time}. Your total is £#{total}"
    )
  end

end
