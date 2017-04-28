require 'menu'

class Order

  def arrival_time
    Time.now + 60 * 60
  end

  def send_confirmation
    account_sid = 'AC1e5119aa010e5c52ad9a8a33490b5ddc'
    auth_token = '199b260df19e3b4802123c0af6c88112'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
    from: '+441698313069',
    to: '+447494442195',
    body: "Your order will be with you at #{arrival_time}."
    )
  end
end
