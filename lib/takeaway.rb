require_relative 'order'
require_relative 'menu'
require_relative 'messenger'
require 'twilio-ruby'

class Takeaway

attr_reader :order

  def initialize (order_class = Order)
    @order = order_class.new
    @client = Messenger.new
  end

    def complete_order(total)
      raise "Sorry that does not match the total" if @order.total_bill != total
      send_text("Thank you for your order")
    end

  def send_text(message)
    @client.messages.create(
      from: '+447507484738',
      to: '+447507484738',
      body: "#{message}"
      )
  end

end