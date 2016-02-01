require_relative 'order'
require 'dotenv'
require 'twilio-ruby'

class OrderDispatch
  @@tokens = Dotenv.load

  def self.build_with_twilio
    new(Twilio::REST::Client.new(
      @@tokens['account_sid'], @@tokens['auth_token']
    ))
  end

  def initialize(client, order_klass = Order)
    # @credentials = Dotenv.load
    @client      = client
    @order_klass = order_klass
  end

  def place_order(order_details, total)
    order = @order_klass.new(order_details, total)
    send_confirmation("Thank you! Your order for £#{order.total} " \
    "will be delivered by #{(Time.now + 60 * 60).strftime "%H:%M"}.")
    order.summary
  end

  private

  def send_confirmation(body)
    @client.account.messages.create(
      from: @@tokens['twilio_num'],
      to:   @@tokens['user_num'],
      body: body
    )
  end
end
