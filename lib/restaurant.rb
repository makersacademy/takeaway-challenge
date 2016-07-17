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
    puts basket.total
  end

  def select_item
    show_menu
    index = gets.chomp.to_i
    basket.add menu.dishes[(index-1)]
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

  def get_index
    input = STDIN.gets.chomp
    return input.to_i if input.is_a?(Integer)
    get_index
  end
end
