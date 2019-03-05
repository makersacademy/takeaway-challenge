require_relative 'menu'

class Order

attr_reader :menu, :basket, :list, :subtotal, :total

def initialize(menu=Menu.new)
    @menu = menu.read
    @basket = []
    @list = []
    @subtotal = []
end

def add_order(dish, number)
  number.times {@basket << dish }
  @subtotal << @menu[dish] * number
  @list << "#{dish.to_s} x#{number} = £#{@subtotal}"
end

def checkout
  fail "No order yet." if @basket[0] == nil
  puts "You ordered:"
  puts @list.join("\n")
  bill = @basket.map {|dish| @menu[dish]}
  @total = bill.inject(:+)
end

end
