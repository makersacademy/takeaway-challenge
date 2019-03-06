require_relative 'menu'

class Order

attr_reader :menu, :basket, :list, :subtotal, :total

def initialize(menu=Menu.new)
    @menu = menu.read
    @basket = []
    @subtotal = []
    @list = []
end

def add_order(dish, number)
  number.times {@basket << dish }
  @subtotal << @menu[dish] * number
  @list << "#{dish.to_s} x#{number} = £#{@subtotal[-1]}"
end


def checkout
  fail "No order yet." if @basket[0] == nil
  puts "You ordered:"
  puts @list.join("\n")
  bill = @basket.map {|dish| @menu[dish]}
  @total = bill.inject(:+)
  fail 'Bill is not correct.' unless check?
  return @total
end

private
def check?
  @subtotal.inject(:+) == @total
end

end
