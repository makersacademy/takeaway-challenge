require_relative 'menu'
require_relative 'order'
class Takeaway

attr_reader :menu, :order_summary, :basket, :bill, :total

def initialize(menu=Menu.new)
  @menu = menu
  @order = Order.new
  @basket = @order.order_summary
  @bill_summary = []
end

  def read_menu
    @menu.dish.to_h
  end

  def add_order(dish,number)
    @order.add_order(dish,number)
    sub_total = self.read_menu[dish] * number
    @bill_summary << "#{dish.to_s} x#{number} = #{sub_total}"
    puts "#{number}x #{dish.to_s}(s) is added to your basket"
  end

  def checkout
    bill = @basket.map {|dish| self.read_menu[dish]}
    @total = bill.inject(:+)
    puts "You ordered:"
    puts @bill_summary.join("\n")
  end

end
