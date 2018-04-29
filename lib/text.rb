require 'twilio-ruby'
require './config.rb'

class Text

  def send
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new Config::ACCOUNT_SID, Config::AUTH_TOKEN

    @client.api.account.messages.create(
      from: Config::TPHONE,
      to: Config::PHONE,
      body: 'Thank you! Your order was placed and will be delivered before 18:52'
    )
  end

end
