class Text

  def initialize

    require 'twilio-ruby'

    account_sid = '****************'
    auth_token = '8c364520c7e11f429972116d0cb0efe8'
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
      from: '+12055909144',
      to: '+++++++++',
      body: 'Thank you for your order. Your food will be with you at ' +
      ((Time.now.strftime("%H").to_i + 1).to_s + ":" + Time.now.strftime("%M")))
    end
end
