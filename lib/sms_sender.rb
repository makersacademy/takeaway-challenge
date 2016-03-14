require "twilio-ruby"
require "dotenv"
Dotenv.load

class SmsSender

  def send_sms
    time = (Time.now+3600).strftime("%H:%M")
    message = "Thank you! Your order was placed and will be delivered before #{time}"
    client.account.messages.create({
      :from => ENV["FROM_PHONE_NUMBER"],
      :to => ENV["TO_PHONE_NUMBER"],
      :body => message
    })
  end

  private

    def client
      Twilio::REST::Client.new ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"]
    end
end
