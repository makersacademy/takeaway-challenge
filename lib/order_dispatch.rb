# require_relative 'takeaway'
require_relative 'order'
require 'dotenv'
require 'twilio-ruby'

class OrderDispatch
  def initialize(client_klass = Twilio::REST::Client)
    @credentials = Dotenv.load
    @client      = client_klass.new(
      @credentials['account_sid'], @credentials['auth_token']
    )
  end

  def new_order(order)
    # TODO: send text
    @client.account.messages.create({
      from: '+441442796261',
      to:   '+447935790008',
      body: "Thank you! Your order was placed and will be delivered before " \
        "#{(Time.now + 60 * 60).strftime "%H:%M"}."
      })
  end
end
