require_relative 'menu'
require_relative 'order'
require_relative 'send_sms'

class Takeaway
  attr_reader :items,:total, :calc_total


  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
    @total
    @items = {}
  end

  def menu
    @menu.list
  end

  def place_order(items, total)
    @items = items
    @total = total
    puts "You have ordered"
    @items.each do |k, v|
      puts k.to_s.ljust(20) + v.to_s.rjust(20)
    end
  end

  def price
     @order.calc_price(@items)
  end

  def confirm_order
    raise 'Sorry total does not match' if calc_total != @total
  end

  def complete_order
    send_notification("Thank you! Your order was placed and will be delivered before #{eta}")
  end

  def send_notification(text)
    Text.new.send_text(text)
  end

  def eta
    time = (Time.now) + 3600
    time.strftime("%H:%M")
  end
end
