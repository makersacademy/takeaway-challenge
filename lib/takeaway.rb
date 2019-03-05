require_relative 'menu'
require_relative 'order'
require_relative 'text'
class Takeaway

attr_reader :menu, :order_summary, :bill, :total, :bill_summary, :each_check

def initialize(menu=Menu.new, order=Order.new, text=Text.new)
  @menu = menu
  @order = order
  @text = text
end

  def read_menu
    @menu.dish.to_h
  end

  def add_order(dish,number)
    @order.add_order(dish,number)
    puts "#{number}x #{dish.to_s}(s) is added to your basket"
  end

  def basket
    @order.order_summary
  end

  def checkout
    @order.checkout
  end

  def confirm_order
    fail 'Bill is not correct.' if !check_bill
    puts "Your total order is £#{@total}"
    @text # seems that text is still being send if check bill is not correct.
    return true
  end

  def total
    @order.total
  end

  private
  def check_bill
    check_total = @order.each_check.inject(:+)
    return true if check_total == @total
  end

end
