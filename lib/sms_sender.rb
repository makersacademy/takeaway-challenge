require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class SmsSender

  TIME = (Time.now+3600).strftime('%H:%M')
  MESSAGE = "Thank you! Your order was placed and will be delivered before #{TIME}"

  def send_sms
    client.account.messages.create({
      :from => ENV['FROM_PHONE_NUMBER'],
      :to => ENV['TO_PHONE_NUMBER'],
      :body =>  MESSAGE
    })
  end

  private

    def client
      Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    end
end
