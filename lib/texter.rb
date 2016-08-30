# require 'ruby-gems'
require 'twilio-ruby'


class Texter

  def send_confirmation
    t = Time.now + 3600
    user = '+447592976861'

    account_sid = 'ACc212765845d7a2bbf3720efec8352103'
auth_token = '73b3a8dc74f665c39dc46bf3970fdf22'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      from: '+441785472303',
  to: user ,
  body: "Thank you! Your order was placed and will be delivered before #{t.hour}:#{t.min}"
    })

  end


end