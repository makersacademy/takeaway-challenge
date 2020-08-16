require 'twilio-ruby'
require_relative 'takeaway'


    account_sid = 'AC0c7fb7eb9b7d262fbee0adb3b8ed0b7e'
    auth_token = 'd848e017d58a443c8f31a1cc818ec5aa'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+12513090304'
    to = '+44' 

    client.messages.create(
    from: from,
    to: to,
    body: "Your order is in the kitchen! You can expect delivery by 21:05 "
    )
