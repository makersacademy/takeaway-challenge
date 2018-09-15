require 'twilio-ruby'
require 'time'

class Delivery
#add own credentials for this to work.
  def send_sms
    account_sid = "TAKEN OUT FOR GIT PUSH"
    auth_token = "TAKEN OUT FOR GIT PUSH"

    client = Twilio::REST::Client.new(account_sid, auth_token)

    delivery_time = Time.now + 1*60*60
    hour = '%02d' % delivery_time.hour
    min = '%02d' % delivery_time.min

    @message = client.messages.create(
      to: "+TAKEN OUT FOR GIT PUSH",
      from: "TAKEN OUT FOR GIT PUSH",
      body: "Thank you! Your order was placed and will be delivered before #{hour}:#{min}"
    )
  end

end
