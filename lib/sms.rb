require 'twilio-ruby'

class SMS

  def initialize
    @account_sid = 'AC2eceeea86b06eed17190d9840ae50980'
    @auth_token = 'fdab8fbf039aa182fab7ca673c8d9a09'
  end

  def delivery_message
    @client = ::Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      from: '+441594372032',
      to: '+447717004167',
      body: "Your order of has been received and should be with you at #{delivery_time}",
    )
  end

  def delivery_time(time = Time.now)
    (time.hour + 1).to_s + ":" + time.min.to_s
  end

private

  attr_reader :account_sid, :auth_token

end
