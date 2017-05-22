require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require_relative 'takeaway'

class TextProvider
  attr_reader :client

  def initialize
    account_sid = 'AC034ed165a8e938089eb0d73e01a10f35'
    auth_token = '6b7a74650475a79697e3d1b8a2998b3b'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text(cost)
    @client.messages.create(
    from: '+441233800574',
    to: '+447479928351',
    body: "Thank you! Your order was placed and will be delivered before 18:52. The total cost of your order is £#{cost}"
    )
  end

end
