class Messenger

  require 'twilio-ruby'

  def send
    account_sid = 'AC30b9000efac4bc5220d635af980a7564'
    auth_token = '8f9a5ba6f0a69b3e911942a76aeef4d5'

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
    :from => '+442870032048',
    :to => '+447545253288',
    :body =>
    "Order received. Estimated delivery_time #{delivery_time}. Thank you."
    })
  end

  private

  def delivery_time
    (Time.now + 3600).strftime("%H:%M")
  end

end
