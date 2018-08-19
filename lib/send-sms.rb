require 'twilio-ruby'
require './lib/deliverytimecalc.rb'

class SMS

  def initialize(calc_time = DeliveryTimeCalc.new)
    @calc_time = calc_time
  end

  def send_sms
    account_sid = "AC9a38d2a7818f803e9c23ded219232787"
    auth_token = "1b70eae15d0b80dcf309a3475f52f3d6"

    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = "+447480486810"
    to = "+447838205185"

    client.messages.create(
      from: from,
      to: to,
      body: "Thank you! Your order has been placed and will be delivered before #{@calc_time.add_one_hour}."
    )
  end

end
