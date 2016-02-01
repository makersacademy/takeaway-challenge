class Messager

  require 'twilio-ruby'
  require 'dotenv'

  def initialize
    @credentials = Dotenv.load
  end

  def send_sms(message)

    @client = Twilio::REST::Client.new @credentials["ACCOUNT_ID"],
                                       @credentials["AUTH_TOKEN"]

    @client.account.messages.create({
    	from: @credentials["PHONE_FROM"],
    	to: @credentials["PHONE_TO"],
    	body: "#{message}",
    })
  end

end
