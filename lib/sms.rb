require 'twilio-ruby'

class Sms

  def send_text
        # put your own credentials here
  account_sid = 'ACbebcab839a2ca06be39a5d7fce369c37'
  auth_token = '454350f1d8fcfc6c2f004829d6014dab'

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create({
    :from => '++441356707023',
    :to => '+447825045830',
    :body => "Thank you! Your order was placed and will be delivered before {get_time}",
  })
  end

  # def get_time
  #   @time = Time.now + 3600
  # end
end
