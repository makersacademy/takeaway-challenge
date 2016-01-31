require_relative 'order'
require 'dotenv'
require 'twilio-ruby'

class OrderDispatch

  def initialize(client_klass = Twilio::REST::Client, order_klass = Order)
    @credentials = Dotenv.load
    @client      = client_klass.new(
      @credentials['account_sid'], @credentials['auth_token']
    )
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
      from: @credentials['twilio_num'],
      to:   @credentials['user_num'],
      body: body
    )
  end
end
