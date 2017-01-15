require 'twilio-ruby'

module SMS

  def send
    print "Please input your phone number: "
    phone = gets.chomp
    details = ['7638f4e1','AC566e4f','a66aa7b423','1a65fe77'], ['0d2d6cb0','57cb85a5','fb580213','7f32e048'], ['133','441','183','206'], ['539','447','637','356']
    account_sid = "#{(details[0][1] + details[0][0] + details[0][3] + details[0][2]).to_s}"
    auth_token = "#{(details[1][1] + details[1][0] + details[1][3] + details[1][2]).to_s}"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
      from: "#{(details[2][1] + details[2][0] + details[2][3] + details[2][2]).to_s}",
      to: "#{phone}",
      body: "Thank you! Your order was placed and will be delivered before #{(Time.new + 3600).strftime('%H:%M')}"
    )
  end
end
