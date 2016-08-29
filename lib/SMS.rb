require 'twilio-ruby'

class SMS
  def initialize
    @account_sid = 'AC39af99827892e269cb7e72ecee580f94'
    @auth_token = '6c2f4f76b620e20fb9fbf89d16d62fe2'
    @twillo_number = "+44 1422 400686"

    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def order_confirmation_sms(phone_number, order_arrival_time)
    @client.account.messages.create({
        :to => phone_number,
        :from => @twillo_number,
        :body => "Your order will be will be with you at #{order_arrival_time}.",
    })
  end

end
