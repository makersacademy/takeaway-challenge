require 'twilio-ruby'

module Customer

  attr_reader :send_text

 def send_text
    # put your own credentials here
    account_sid = 'ACdff620df7376a7affc0d0ae499f860d1'
    auth_token = 'e2db70e02bb0b68a9994bd0893d5a875'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => '+442380000106', #replace with Twilio number
      :to => '+447939172106', #replace with Customer mobile
      :body => "Thanks for your order at Asian Sensation! Your order will be with you by #{delivery_time}",
    })
  end

  def delivery_time
    delivery_time = Time.now + 1*60*60
    delivery_time.strftime('%H:%M')
  end


end
