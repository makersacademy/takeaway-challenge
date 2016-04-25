
require_relative 'messenger'
require_relative 'order'


class Restaurant
attr_reader :order_accepted
  def initialize(messenger_class = Messenger, order_class = Order)
    @messenger = messenger_class.new
    @order = order_class.new
    @order_accepted = []
  end
  def accept_order(user)
    if user.checkout == true
     "order accepted"
     @order_accepted << user.order
   else
    "order not accepted please try again"
    end
  end


  def deliver
    confirm_order(order_complete)
  end

 private
  def confirm_order(confirmed_order)
    @messenger.send_order(confirmed_order.object_id)
  end


  def order_complete
    @order_accepted.shift
  end
end
