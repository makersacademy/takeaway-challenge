require 'twilio-ruby'

module TwilioSMS

  def confirmation_text
    account_sid = 'AC75691f02c19e650fb33a21f44947d01e'
    auth_token = '4386a045115a3f96f6554139ca2928ab'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => '+441456256035',
      :to => '+447429924828',
      :body => "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}"
    })
  end
end
