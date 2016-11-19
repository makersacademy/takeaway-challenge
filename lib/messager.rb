require 'twilio-ruby'


class Messager
def initialize
@account_sid = 'AC16ae84745f5978c95f4adccf3e18bcc5'
@auth_token = 'ea8fdac935ce3f60e71537a10fa6a5a2'
end

  def send_message
    twilio_number = "+441280830048"
    phone_number = "+447896036978"
    Twilio.configure do |config|
      config.account_sid = @account_sid
      config.auth_token = @auth_token
end
@client = Twilio::REST::Client.new
    client.messages.create(
      from: twilio_number,
      to:   phone_number,
      body: "Your order is ready to go and will arrive at #{self.delivery_time}"
    )
  end

   def self.delivery_time
     time = (Time.new + 1*60*60).asctime
     hour_and_min = time[11,5]
   end
end
