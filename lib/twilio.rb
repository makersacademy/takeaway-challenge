require 'twilio-ruby'

class Twilio_sms

  def index
  end

  def send_text_message

    account_sid= 'AC0b5e68dd8ffad76c7ca97787af3b4eca'
    auth_token = '3837b88724c6df09e1dafba69b36266a'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.sms.messages.create(
      :from => '+441340202055',
      :to => '+447482042351',
      :body => "Thank you! Your order was placed and will be delivered before 18:52."
    )
  end
end
