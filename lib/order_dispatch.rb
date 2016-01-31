require_relative 'order'
require 'dotenv'
require 'twilio-ruby'

class OrderDispatch

  def self.build_with_client
    new(Twilio::REST::Client.new(
      @credentials['account_sid'], @credentials['auth_token']
    ))
  end

  def initialize(client, order_klass = Order)
    @history     = []
    @credentials = Dotenv.load
    @client      = client
    @order_klass = order_klass
  end

  def place_order(order_details)
    order = @order_klass.new(order_details)
    send_confirmation
    @history << order
  end

  def order_history
    @history.clone.freeze
  end

  private

  def send_confirmation
    @client.account.messages.create(
      from: @credentials['twilio_num'],
      to:   @credentials['user_num'],
      body: "Thank you! Your order was placed and will be delivered before " \
        "#{(Time.now + 60 * 60).strftime "%H:%M"}."
    )
  end
end
