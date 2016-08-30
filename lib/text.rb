require 'twilio-ruby'

class Text

  account_sid = 'AC2c6e58203b4fb174cbd5e042d7798a9d'
  auth_token = '6d1d56de140e0d052dee0d1201b4efd0'

  @client = Twilio::REST::Client.new account_sid, auth_token

  def self.confirmation
    @client.account.messages.create({
      from: '+441183241614',
      to: '+447429013393',
    	body: "Thank you! Your order was placed and will be delivered before #{
      format("%02d",(Time.now.hour+1)%24) }:#{ format("%02d",Time.now.min) }",
    })
    "confirmation message sent"
  end
end
