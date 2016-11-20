require './lib/menu'
require './lib/SMS'

class Takeaway

  attr_reader :menu, :order, :message_type, :basket

  DEFAULT_QUANTITY = 1

  def initialize(klass1, klass2, klass3)
    @menu = klass1.new
    @order = klass2.new
    @message_type = klass3.new
    @basket = []
  end

  def select_item(item, quantity = DEFAULT_QUANTITY)
    return "Not a valid item" if !in_menu?(item)
    add_to_basket(item, quantity)
  end

  def add_to_basket(item, quantity)
    self.basket << {:item=>item, :qty=>quantity}
    "#{quantity}x #{item} added to your basket"
  end

  def view_basket
    @basket.each { |line| "#{line[:qty]}x #{line[:item]}}" }
  end

  def confirm_order(total)
    return "Incorrect Total" if total != calculate_total
    send_confirmation_message('Thank you! Your order was placed and will be delivered before ' + (Time.now + 3600).to_s)
    "Thank you for your order: £" + total.to_s
  end

  def send_confirmation_message(message)
    @message_type.send_sms(message)
  end

  def in_menu?(item)
    @menu.menu_list.has_key?(item)
  end

  def calculate_total
    self.basket.each.inject(0) { |sum, line| sum + (@menu.menu_list[line[:item]] * line[:qty])}
  end



end
