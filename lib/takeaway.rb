require_relative 'menu'
require_relative 'order'
class Takeaway

attr_reader :menu, :order_summary, :basket, :bill, :total, :bill_summary, :each_check

def initialize(menu=Menu.new)
  @menu = menu
  @order = Order.new
  @basket = @order.order_summary
  @bill_summary = []
  @each_check = 0
end

  def read_menu
    @menu.dish.to_h
  end

  def add_order(dish,number)
    @order.add_order(dish,number)
    sub_total = self.read_menu[dish] * number
    @each_check += sub_total
    @bill_summary << "#{dish.to_s} x#{number} = #{sub_total}"
    puts "#{number}x #{dish.to_s}(s) is added to your basket"
  end

  def checkout
    fail "No order yet." if @basket[0] == nil
    puts "You ordered:"
    puts @bill_summary.join("\n")
    bill = @basket.map {|dish| self.read_menu[dish]}
    @total = bill.inject(:+)
  end

  def complete?
    fail 'Bill is not correct.' if @each_check != @total
    !!@basket
  end

end
