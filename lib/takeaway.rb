class Takeaway
  attr_accessor :menu, :print_menu, :order

  def initialize
    @menu = menu || {kebab: 7, burger: 6, pizza: 7, curry: 8}
    @print_menu = menu
    @order = order
  end
def print_menu
puts "Here is our #{@menu}"
end
def place_order
@order = order

end
end
