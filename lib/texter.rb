require 'twilio-ruby'

class Texter

  def message(time)
      # put your own credentials here
    account_sid = '***********************'
    auth_token = '*************************'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => '***************',
      :to => '***************',
      :body => "Thank you! Your order was placed and will be delivered before #{time}",
    })
  end

end
