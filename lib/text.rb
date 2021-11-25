require 'twilio-ruby'

class Text
  def initialize
    account_sid = 'AC5e4e1ddec6330a437df6f9f1345820a4'
    auth_token = '19611e6b79439b49b4c397bade54dadc'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
    
  def send_text 
    @client.messages.create(
      from: '+447401748531',
      to: '+447738337111',
      body: "Thank you! Your order was placed and will be delivered before 18:52"
    )
  end
end