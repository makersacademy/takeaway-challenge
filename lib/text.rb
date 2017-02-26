require 'rubygems'
require 'twilio-ruby'


class Text

  def confirmation(total_price, phone_number)
    @phone_number = phone_number
    send_SMS("Thank you! Your order was placed and will be delivered before #{Time.now + (60*60)}. Total price: £#{total_price}")
  end


  def send_SMS(message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => ENV['FROM_PHONE'],
      :to => @phone_number,
      :body => message,
    })

  end

end
