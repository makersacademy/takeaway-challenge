
require 'rubygems'
require 'twilio-ruby'

class Sms

  def initialize
    account_sid = "AC950551adcf48a40cba8cf09ad9f4c71c"
    auth_token = "67a9e7c99fad1393388a4493c24e649e"
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_confirmation
    delivery_time = Time.now + (60 * 60)
    @client.account.messages.create(
    :from => "+441286727021",
    :to => "+447828085891",
    :body => "Thanks for placing your order! Your food will be here before #{delivery_time.strftime('%H:%M')}.")
  end

end
