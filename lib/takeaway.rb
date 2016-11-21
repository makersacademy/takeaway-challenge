require './lib/menu'
require './lib/order'
require './lib/SMS'

class Takeaway

  attr_reader :menu, :order, :message_type

  DEFAULT_QUANTITY = 1

  def initialize(klass1, klass2)
    @menu = klass1.new
    @message_type = klass2
  end

  def view_menu
    @menu.menu_list.each { |k,v| puts "#{k} " + "%.2f" % v }
  end

  def create_order
    @order = Order.new
  end

  def select_item(item, quantity = DEFAULT_QUANTITY)
    return "Not a valid item" if !in_menu?(item)
    add_to_basket(item, quantity)
  end

  def confirm_order(total)
    return "Incorrect Total" if total != calculate_total
    send_confirmation_message('Thank you! Your order was placed and will be delivered before ' + (Time.now + 3600).strftime("%R"))
    "Thank you for your order: £" + "%.2f" % total
  end

  #private

  def add_to_basket(item, quantity)
    @order.basket << {:item=>item, :qty=>quantity}
    "#{quantity}x #{item} added to your basket"
  end

  def send_confirmation_message(message)
    @message_type.new.send_sms(message)
  end

  def in_menu?(item)
    @menu.menu_list.has_key?(item)
  end

  def calculate_total
    @order.basket.each.inject(0) { |sum, line| sum + (@menu.menu_list[line[:item]] * line[:qty])}
  end

end
