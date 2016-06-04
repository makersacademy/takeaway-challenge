#sends message to customer
class Messenger

  require 'twilio-ruby'

  def send
    account_sid = 'AC30b9000efac4bc5220d635af980a7564'
    auth_token = '8f9a5ba6f0a69b3e911942a76aeef4d5'

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
    :from => '+442870032048',
    :to => '+447545253088',
    :body =>
    "Order Received. Estimated delivery time: #{Time.now.hour + 1}:#{ Time.now.min }. Thank you."
    })
  end
end
