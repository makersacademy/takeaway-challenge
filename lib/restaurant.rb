require_relative 'menu'
require_relative 'basket'

class Restaurant
attr_reader :menu, :basket
  def initialize
    @menu = Menu.new
    @basket = Basket.new
  end

  def show_menu
    list(menu.dishes)
  end

  def show_basket
    list(basket.dishes)
    puts "£#{basket.total}".rjust(50)
  end

  def select_item(index)
    basket.add menu.dishes[(index.to_i-1)]
  end

private

  def list(arr)
    arr.each.with_index(1) do |d,i|
      amount = d.price.dup
      print "#{i}.".center(5)
      print d.name.ljust(30,'.')
      print  "£#{amount.insert(-3, '.')}".rjust(15,'.') + "\n"
    end
  end
end
