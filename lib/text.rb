# manages the confirmation via Twilio

require 'twilio-ruby'

class TextMessage

  def paid(payment)
    eta = (Time.now + (60*60)).strftime("%H:%M")
    account_sid = 'AC3af590b092146a66c518bf8de91d7679'
    auth_token = 'a227210a2d9e9a23a576747a36868d9f'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
    from: '+441691700044',
    to: '+447472693445',
    body: "Your payment of £#{'%.2f' % payment} has been accepted.
    Your food should be with you by #{eta}. Enjoy your meal"
    )
  end
end
