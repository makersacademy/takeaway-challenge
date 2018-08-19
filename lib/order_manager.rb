require 'twilio-ruby'
require_relative 'passw'
require_relative 'order'
require_relative "message"

class Order_manager
  # tracks all the orders
  attr_reader :orders, :text_orders

  def initialize
    @orders = Hash.new
    @text_orders = []
  end

  def new_order(customerID, number, request, order_klass = Order)
    order = order_klass.new(customerID, number, request)
    @orders[customerID] = order
  end

  def pull_text_orders
    account_sid = ACCOUNT_SID
    auth_token = AUTH_TOKEN
    client = Twilio::REST::Client.new account_sid, auth_token
    data = client.api.account.messages.list
    @text_orders = data.map { |m|
      [m.from, m.body] if m.direction == "inbound"
    }
    @text_orders.compact!
    create_text_orders
  end

  def confirm(custID, message = Message.new)
    order = @orders[custID]
    if order.count == order.total
      message.send_confirmation(order.number)
    else
      false
    end
  end

  private
  def create_text_orders
    @text_orders.each { |o|
      new_order(o[0], o[0], o[1])
    }
  end

end
