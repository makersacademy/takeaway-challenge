require 'rubygems'
require 'twilio-ruby'

class Send_sms

  attr_reader :message

  account_sid = 'ACd2c38d2ce06b9cd4b8574d28d2aa773b'
  auth_token = '184a082741b65d04da86ab5ce7dc89e3'
  @@client = Twilio::REST::Client.new account_sid, auth_token

  def send_confirmation_sms phonenumber
    t = (Time.new + 3600).strftime("%I:%M%p")
    @message = @@client.account.messages.create({
      :from => '+441740582026',
      :to => phonenumber,
      :body => 'Thank you! We have received your order and will deliver it before ' + t
    })
  end

end