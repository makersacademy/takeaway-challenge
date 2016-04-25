
require 'dotenv'
Dotenv.load

require 'rubygems'
require 'twilio-ruby'

class Order

  def initialize
   @client = Twilio::REST::Client.new 'AC91e34ed986c55316d3075d8c0e7ceadc', '3cb19b7887b1bcec785feb2d6e103ddc'
  end

  def send
    @client.account.messages.create(
        from: '+441527962168',
        to: '+447534070574',
        body: "Thank you for your order, "\
      "It will be delivered by #{Time.now + (60 * 60)}"
    )
  end
end

