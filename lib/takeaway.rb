require_relative 'menu'
require_relative 'order'
require_relative 'message'

class Takeaway

  attr_reader :menu, :order, :text

  def initialize(menu = Menu.new, order = Order.new, text = Message.new)
    @menu = menu
    @order = order
    @text = text
  end

  def read_menu
    @menu.options
  end

  def order(item, quantity)
    @order.add_dish(item, quantity)
  end

  def basket_summary
    summary_string
  end

  def total
    total = total_calc
    "£#{total}"
  end

  def checkout(payment)
    fail 'Incorrect payment' if payment != total_calc
    @text.send_sms
    @order = Order.new
  end

  private

  def summary_string
    summary = ""
    @order.items.each do |k, v|
      sum = menu.options[k] * v
      summary << "#{k} x#{v} = £#{sum},"
    end
    summary
  end

  def total_calc
    @menu.options.reduce(0) {|total, (k, v)| total += @order.items[k] * v}
  end
end
