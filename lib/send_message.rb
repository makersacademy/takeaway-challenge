require 'twilio-ruby'

module TwilioHandler

class SMS

attr_reader :client

def send_sms(phone_number, total)
    account_sid = ENV[ 'AC94fc86fa3465574900acbcdf827e2352 ']
    auth_token = ENV['0937909d1add71a5bf770b6807a19ad2']
    client = TWILIO::REST::Client.new(account_sid, auth_token)
    from = '+12564744369'
    to = "+#{447572433980}"
    client.messages.create(
        from: from,
        to: to,
        body: 'Hi there - your order is on its way and your total is £#{total}'
    )
  end 

end 