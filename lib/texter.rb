require 'twilio-ruby'

class Texter

  def message(time)
      # put your own credentials here
    account_sid = 'ACcbeef6a646d9fd337cc2b72ace78cd50'
    auth_token = 'c26cea2f00cf3916095fb17bfd2342ec'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => '+441352860045',
      :to => '+447883339743',
      :body => "Thank you! Your order was placed and will be delivered before #{time}",
    })
  end

end
