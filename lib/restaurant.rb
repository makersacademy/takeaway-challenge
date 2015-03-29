require 'twilio-ruby'

# Issue right now is that everything has to be created; customers, orders,
# menus, dishes.
# I need a UI for the customer interaction with restaurant, and I need to save
# At least 1 menu somewhere
# And I need time
class Restaurant
  attr_reader :menu, :pending_orders, :completed_orders

  def initialize menu
    @menu, @pending_orders, @completed_orders = menu, [], []
    account_sid = 'ACcfd822b8c0e03bbc254ea0979dc90f66'
    auth_token = 'b137a11502c6f3101c38554a4ff09444'

    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def open_new_order order
    @pending_orders.push(order)
  end

  def order_ready order
    @completed_orders.push(order)
    @pending_orders.delete(order)
    order.ready_for_delivery
    @client.messages.create(from: '+441424531195', to: '+447809714441',
                            body: 'You\'re order is ready and
                            will be with you soon!')
  end
end
