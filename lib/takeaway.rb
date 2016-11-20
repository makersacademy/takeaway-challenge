require './lib/menu'
require './lib/SMS'

class Takeaway

  attr_reader :menu, :order, :message_type, :basket

  DEFAULT_QUANTITY = 1

  def initialize(klass1, klass2)
    @menu = klass1.new
    @message_type = klass2
    @basket = []
  end

  def select_item(item, quantity = DEFAULT_QUANTITY)
    return "Not a valid item" if !in_menu?(item)
    add_to_basket(item, quantity)
  end

  def view_basket
    @basket.each { |line| puts "#{line[:qty]}x #{line[:item]} @ £" + "%.2f" % @menu.menu_list[line[:item]] }
  end

  def confirm_order(total)
    return "Incorrect Total" if total != calculate_total
    send_confirmation_message('Thank you! Your order was placed and will be delivered before ' + (Time.now + 3600).strftime("%R"))
    "Thank you for your order: £" + "%.2f" % total
  end

  private

  def add_to_basket(item, quantity)
    self.basket << {:item=>item, :qty=>quantity}
    "#{quantity}x #{item} added to your basket"
  end

  def send_confirmation_message(message)
    @message_type.new.send_sms(message)
  end

  def in_menu?(item)
    @menu.menu_list.has_key?(item)
  end

  def calculate_total
    self.basket.each.inject(0) { |sum, line| sum + (@menu.menu_list[line[:item]] * line[:qty])}
  end

end
