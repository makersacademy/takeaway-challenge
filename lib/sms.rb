class Sms
  def send_text
    require 'twilio-ruby'

    # put your own credentials here
    account_sid = 'AC33011a40dc7a73068b3aecbc38deb302'
    auth_token = '2b6b55ca0e757662eae67ee5df0fcac0'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
    	:from => '+441757322034',
    	:to => '+44 7479322408',
    	:body => "Thank you! Your order was placed and will be delivered before #{(Time.new + 3600).strftime("%H:%M")}",
    })
  end
end
