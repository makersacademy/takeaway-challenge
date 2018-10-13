require_relative 'menu'
require_relative 'order'

class Takeaway

  include Menu

  def initialize(new_order = Order.new)
    @new_order = new_order
  end

  def menu
    print format_menu_items
  end

  def add_to_order(name, quantity = 1)
    @new_order.add_dish(name, quantity)
  end

  # def basket_items
  #   @new_order.order_items
  # end

  def basket
    # @new_order.basket_items
    @new_order.basket_items
  end

  def print_basket
    print "Your basket:\n"
    print basket
    print "\nOrder total: £#{@new_order.total}\n"
  end

  def submit_order
    raise "Basket empty" if @new_order.order_items.empty?
    raise "Order already sent" if @new_order.submitted
    send_message
    # submit_confirm = Messaging.new
    # submit_confirm.send_message
    @new_order.submitted = true
  end

   def send_message(new_message = Messaging.new)
     new_message.send
     # @new_order.submitted
   end

  private

  attr_reader :new_order


end
