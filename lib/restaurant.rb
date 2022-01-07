require 'twilio-ruby'
require 'twilio-credentials'

# put your own credentials here
account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
api_key_sid = 'zzzzzzzzzzzzzzzzzzzzzz'
api_key_secret = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'

# set up a client to talk to the Twilio REST API using an API Key
@client = Twilio::REST::Client.new api_key_sid, api_key_secret, account_sid

class Restaurant

  WAIT_TIME = 3600 # in seconds

  def place(order)
    @order = order
    deadline = wait.strftime('%H:%M')
    message = "Thank you! Your order was placed and will be delivered before #{deadline}"
  end

  private

  def wait
    wait_time = WAIT_TIME + Time.now.to_i
    wait = Time.at(wait_time)
  end
end
