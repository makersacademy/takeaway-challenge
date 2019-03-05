require_relative 'menu'

class Order

attr_reader :menu, :basket, :bill_summary, :subtotal, :total

def initialize(menu=Menu.new)
    @menu = menu.dish.to_h
    @basket = []
    @bill_summary = []
    @subtotal = []
end

def add_order(dish,number)
  number.times {@basket << dish }
  @subtotal << @menu[dish] * number
  @bill_summary << "#{dish.to_s} x#{number} = £#{@subtotal}"
end

def checkout
  fail "No order yet." if @basket[0] == nil
  puts "You ordered:"
  puts @bill_summary.join("\n")
  bill = @basket.map {|dish| @menu[dish]}
  @total = bill.inject(:+)
end

end
