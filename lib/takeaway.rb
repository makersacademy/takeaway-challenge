require_relative 'menu'
require_relative 'digital_till'
require_relative 'messenger'
require_relative 'orders'

class Takeaway
  attr_reader :menu, :orders

  def initialize(menu: menu_object, orders_class: Orders,
                 messenger_class: Messenger)
    @menu = menu
    @orders = orders_class.new(menu: menu)
    @messenger_class = messenger_class
  end

  def add_items(items)
    @orders.make_order(items)
  end

  def complete_order(total)
    @orders.submit_order(total)
    message_customer
  end

  def view_menu
    @menu.view_items
  end

  def current_order
    @orders.current_order
  end

  def view_last_receipt
    puts @orders.history[-1]
  end

  def view_all_receipts
    puts @orders.history.reverse
  end

  private

  def message_customer
    @messenger_class.new.sms_confirmation
  end

end
