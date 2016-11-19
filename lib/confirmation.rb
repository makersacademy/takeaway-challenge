require 'twilio-ruby'

account_sid = 'ACa2a3c5def88970d08a87bc3e637e7d20'
auth_token = '1c65438a0ef417767069b5acbd848f70'

@customer = Twilio::REST::Client.new account_sid, auth_token


def test_confirmation
  @customer.messages.create(
    from: '+442033223757',
    to: '+447711581360',
    body: 'Hi sweet Isabel'
  )
end

test_confirmation
