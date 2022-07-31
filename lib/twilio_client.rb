# frozen_literial_string: true

require 'twilio-ruby'

class TwilioClient
  def send_text(time)
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before #{time}",
      messaging_service_sid: ENV['MESSAGING_SERVICE_SID'],
      to: ENV['RECEIVER_NUMBER']
    )
    message.status
  end
end
