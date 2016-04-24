
require_relative 'messenger'
require_relative 'order'


class Restaurant
attr_reader :order_accepted
def initialize(messenger_class = Messenger, order_class = Order)
  @messenger = messenger_class.new
  @order = order_class.new
  @order_accepted = []
end

  def confirm_order(confirmed_order)
    #@messenger.send_order(basket_summary(confirmed_order))
    @messenger.send_order(confirmed_order.object_id)
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
    confirm_order(@order_accepted.shift)
  end

end


nandos=Restaurant.new
harry=Order.new
john=Order.new
john.add_item_qty("diet coke", 8)
john.add_item_qty("caviar", 8)

harry.add_item_qty("diet coke", 8)
harry.add_item_qty("caviar", 8)
harry.add_item_qty("oyster", 8)
harry.checkout_order(807.84)
john.checkout_order(799.92)

p nandos.accept_order(harry)
p nandos.order_accepted
p nandos.accept_order(john)
p nandos.order_accepted
nandos.deliver
p nandos.order_accepted
nandos.deliver
p nandos.order_accepted

