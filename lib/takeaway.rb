require_relative 'menu'

class Takeaway

  attr_reader :basket

  def initialize
    @menu = Menu.new
    @basket = []
  end

  def view(basket)
    print @basket
  end

  def display(menu)
    puts "Today's Menu \n".center(20)
    menu.items.each do |item, price|
      puts "#{item}: £#{price}".center(20)
    end
  end

  def add_to_basket(item, quantity)
    quantity.times { @basket << @menu.items[item] }
    # fail "Incorrect total" if total != @basket.sum
  end

end
