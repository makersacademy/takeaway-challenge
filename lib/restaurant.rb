
require_relative 'messenger'
require_relative 'order'


class Restaurant
attr_reader :order_accepted
def initialize(messenger_class = Messenger, order_class = Order, menu_class = Menu)
  @messenger = messenger_class.new
  @order = order_class.new
  @menu = menu_class.new
  @order_accepted = []
end

def confirm_order(confirmed_order)
  #@messenger.send_order(basket_summary(confirmed_order))
  @messenger.send_order(confirmed_order.object_id)
end

def accept_order(user)
     @order_accepted << user.order
end

def deliver
  confirm_order(@order_accepted.shift)
end

  def checkout(order)
    @order.order_total == get_total(order)
  end

  def get_total(object)
    object.order.map{|x| x[1]*x[2]}.inject{|acc,x| acc+=x}
  end
def check_on_menu?(object)
  object.order.map { |x| view_menu.key? x[0]}.all?
end
end
# nandos=Restaurant.new
# harry=Order.new
# john=Order.new
# harry.add_item_qty("diet coke", 8)
# harry.add_item_qty("caviar", 8)
# #harry.add_item_qty("butter", 8)

# nandos.accept_order(harry)
# nandos.view_menu
# p nandos.check_on_menu? harry
# p nandos.order_accepted
# #p nandos.deliver
# p nandos.checkout(harry)

