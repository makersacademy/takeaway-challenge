require 'twilio-ruby'
require_relative '.env'

class TwilioSend

  def message
    time = (Time.new + 3600).strftime("%H:%M")
    "Thank you! Your order was placed and will be delivered before #{time}."
  end

  def sms(mobile)
    @twilio_number = ENV[:number]
    @client = Twilio::REST::Client.new ENV[:account_sid], ENV[:auth_token]
    @client.messages.create(
      from: @twilio_number,
      to: mobile.to_s,
      body: message)
  end

end

# Twilio::REST::Client.new


# def initialize(twilio_client, twilio_number)
# 		@client = twilio_client
# 		@number = twilio_number
# 	end
#
# 	def send_confirmation_message(message)
# 		@client.account.messages.create(
# 		from: @number,
#       to: "+447729835662",
#       body: message
# 		)
# 	end
