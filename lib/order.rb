require_relative 'menu'

class Order

attr_reader :menu, :order_summary, :bill_summary, :each_check, :total

def initialize(menu=Menu.new)
    @menu = menu.dish.to_h
    @order_summary = []
    @bill_summary = []
    @each_check = []
end

def add_order(dish,number)
  number.times {@order_summary << dish }
  sub_total = self.menu[dish] * number
  @each_check << sub_total
  @bill_summary << "#{dish.to_s} x#{number} = £#{sub_total}"
end

def checkout
  fail "No order yet." if @order_summary[0] == nil
  puts "You ordered:"
  puts @bill_summary.join("\n")
  bill = @order_summary.map {|dish| @menu[dish]}
  @total = bill.inject(:+)
end

end
