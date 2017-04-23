require 'twilio-ruby'

class MessageSender

  ADDITIONAL_TIME = (45*60)

  def self.send_text(name, phone_number, message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token
    from = "+441740582048"
    time = (Time.now + ADDITIONAL_TIME).strftime("%H.%M")
      client.account.messages.create(
        :from => from,
        :to => phone_number,
        :body => "Hello #{name}, your order has been dispatched from Makers Bistro.\n#{message} It will arrive in #{ADDITIONAL_TIME/60} minutes at #{time}!"
      )
  end

end
