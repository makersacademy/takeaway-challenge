require_relative 'menu'
require_relative 'basket'

class Restaurant
attr_reader :menu, :basket
  def initialize
    @menu = Menu.new
    @basket = Basket.new
  end

  def show_menu
    menu_title
    list(menu.dishes)
  end

  def show_basket
    basket_title
    list(basket.dishes)
    basket_total
  end

  def select_item(index)
    item = menu.dishes[(index.to_i-1)]
    basket.add item
    added_confirmation(item)
  end

  def new_order
    @basket = Basket.new
  end

private

  def added_confirmation(item)
    puts "#{item.name} added to basket."
  end

  def basket_total
    puts "TOTAL: £#{basket.total}".rjust(50)
  end

  def basket_title
    puts "YOUR BASKET".center(50, '=')
  end

  def menu_title
    puts "MENU".center(50, '=')
  end

  def list(arr)
    arr.each.with_index(1) do |d,i|
      amount = d.price.dup
      print "#{i}.".center(5)
      print d.name.ljust(30,'.')
      print  "£#{amount.insert(-3, '.')}".rjust(15,'.') + "\n"
    end
  end
end
