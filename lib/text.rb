class Text

  def initialize

    require 'twilio-ruby'

    account_sid = 'AC74d94c5090f5fc72b273ea5de2ba5808'
    auth_token = '8c364520c7e11f429972116d0cb0efe8'
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
      from: '+12055909144',
      to: '+44 7429 264027',
      body: 'Thank you for your order. Your food will be with you at ' +
      ((Time.now.strftime("%H").to_i + 1).to_s + ":" + Time.now.strftime("%M")))
    end
end
