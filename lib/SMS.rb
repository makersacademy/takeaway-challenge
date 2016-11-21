require 'twilio-ruby'

class SMS

  def send_sms(message)

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => ENV['TWILIO_FROM_PHONE'],
      :to => ENV['TWILIO_TO_PHONE'],
      :body => message
    })

  end

end
