require 'twilio-ruby'




class Message

  def time
    @time = time
    time = Time.now
    delivery_time = (time + 45*60).strftime("%R")
  end

  def self.send
    # def send

    account_sid = 'ACdee469cd997b8b892665ed9ae3c94c07'
    auth_token = '64da49b1aacfc64a21ff278e50482e64'

    # time = Time.now
    # delivery_time = (time + 45*60).strftime("%R")

    @client = Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.messages.create(
      body: "Thank you!, Your order has been placed and should be with you by #{@time}",
      from: '+441293311593',
      to: '+447921122767'
    )

    message.sid

  end

end
