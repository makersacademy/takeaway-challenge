require 'twilio-ruby'

class Sms
# account_sid = "AC8c729440af62ea5068ab6ea29bf97572"
# auth_token = "797e10623b47e2e70b2c06f032c554b3"
  def initialize
    @client = Twilio::REST::Client.new("AC8c729440af62ea5068ab6ea29bf97572", "797e10623b47e2e70b2c06f032c554b3")
  end

  def send_sms
    @client.messages.create(
      :from => "+441618504066",
      :to => "+447969100968",
      :body => "Thank you for your order. Your takeaway will be with you at #{Time.new.hour+1}:#{Time.new.min}"
      )
    end
end
