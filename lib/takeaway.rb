require_relative 'menu'
require_relative 'order'
require_relative 'text'
class Takeaway

attr_reader :menu, :order_summary, :basket, :bill, :total, :bill_summary, :each_check

def initialize(menu=Menu.new)
  @menu = menu
  @order = Order.new
  @basket = @order.order_summary
  @bill_summary = @order.bill_summary
  @each_check = @order.each_check
  @send_sms = Text.new
end

  def read_menu
    @menu.dish.to_h
  end

  def add_order(dish,number)
    @order.add_order(dish,number)
    puts "#{number}x #{dish.to_s}(s) is added to your basket"
  end

  def checkout
    fail "No order yet." if @basket[0] == nil
    puts "You ordered:"
    puts @bill_summary.join("\n")
    bill = @basket.map {|dish| self.read_menu[dish]}
    @total = bill.inject(:+)
  end

  def confirm_order
    fail 'Bill is not correct.' if !check_bill
    puts "Your total order is £#{@total}"
    @send_sms
  end

  private
  def check_bill
    check_total = @each_check.inject(:+)
    return true if check_total == @total
  end

end
