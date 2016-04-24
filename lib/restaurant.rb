
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
   @order_accepted << user.order
end

def deliver
  confirm_order(@order_accepted.shift)
end
def basket_summary(object)
    #accesses the order variable which is initialized in the object where the order is stored
    #raise "basket is empty" if @order == []
    object.order.map{|unit,price,qty|  "#{unit} x#{qty} = #{qty*price}"}
  end

  def get_total(object)
    object.order.map{|x| x[1]*x[2]}.inject{|acc,x| acc+=x}
  end


end