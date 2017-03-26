require 'twilio-ruby'
require 'envyable'
Envyable.load('./config/env.yml', 'development')

class SMS

  def send_sms(message)

    client = Twilio::REST::Client.new(
    ENV["TWILIO_ACCOUNT_SID"],
    ENV["TWILIO_AUTH_TOKEN"]
    )

    client.account.messages.create(
      :to => ENV["NUMBER"],
      :from => "+44 1244 470434",
      :body => message
    )
  end
end
