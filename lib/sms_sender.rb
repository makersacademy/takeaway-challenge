require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class SmsSender

  MESSAGE = "Thank you! Your order was placed and will be delivered before #{(Time.now+3600).strftime('%H:%M')}"

  def initialize(client = create_client)
    @client = client
  end

  def send_sms
    @client.account.messages.create({
      :from => ENV['FROM_PHONE_NUMBER'],
      :to => ENV['TO_PHONE_NUMBER'],
      :body =>  MESSAGE
    })
  end

  private

    def create_client
      Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    end

end
