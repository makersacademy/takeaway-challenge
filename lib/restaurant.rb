
require_relative 'messenger'
require_relative 'order'


class Restaurant
attr_reader :order_accepted
  def initialize(messenger_class = Messenger)#, order_class = Order)
    @messenger = messenger_class.new
    @order_accepted = []
  end

  def accept_order(user, order_class=Order)
    @order = order_class
   #raise "order not accepted please try again" unless user_checked_out? user
    #{}"order accepted"
    @order_accepted << user.order
  end


  def deliver
    confirm_order(order_complete)
  end
  private
    def user_checked_out?(object)
    object.checked_out
  end

  def confirm_order(confirmed_order)
    @messenger.send_order(confirmed_order.object_id)
  end


  def order_complete
    @order_accepted.shift
  end
end

# r = Restaurant.new
# harry = Order.new
# harry.add_item_qty("diet coke", 8)
# p harry.checkout_order(7.92)
# p r.accept_order(harry)
# p r.user_checked_out?(harry)
