# sends confirmation SMS through Twilio

require 'twilio-ruby'

class Confirm

  def initialize
  	@account_sid = 'ACb33f4fd0aff5c7fda8281e6869974440'
  	@auth_token = '51c5fd32f133774decb77521d9469814'
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_sms
    estimate = (Time.now + 3600).strftime("%H:%M")
    @client.account.messages.create({from: '+441803503017',
                                     to: '+447809148347',
                                     body: "Thank you! Your order was placed and will be delivered before #{estimate}"})
  end

end
