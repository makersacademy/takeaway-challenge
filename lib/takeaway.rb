require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def check_menu
    print @menu.list
  end

  def add_to_order(item, quantity)
    @order.add(item, quantity)
  end

  def summary
    @order.summary
  end

  def total
    "total - £#{@order.total}"
  end

  def place_order(given_total)
    fail "given total is incorrect" if @order.total != given_total

    send_sms
  end

  private

  def send_sms
    Sms.new.send
  end

end
