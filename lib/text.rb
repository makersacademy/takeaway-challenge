require 'rubygems'
require 'twilio-ruby'

class Text

  def confirmation(total_price, phone_number)
    @phone_number = phone_number
    send_SMS("Thank you! Your order was placed and will be delivered before #{Time.now + (60*60)}. Total price: £#{total_price}")
  end

  def send_SMS(message)
    account_sid = 'AC69064164571cfd340c23429315dab09d'
    auth_token = 'ea1d61a5bad892e013f212a72b6af4df'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => '+441303720111',
      :to => @phone_number,
      :body => message,
    })

  end

end
