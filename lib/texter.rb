require 'twilio-ruby'

class Texter

  def message(time)
      # put your own credentials here
    account_sid = ENV['account_sid']
    auth_token = ENV['auth_token']

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => ENV['from'],
      :to => ENV['to'],
      :body => "Thank you! Your order was placed and will be delivered before #{time}",
    })
  end

end

# use this way in command line 
# export var_name=xxxxxxxxxxxxxx
