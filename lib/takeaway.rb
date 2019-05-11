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
    menu.items.each do |item, price|
    puts "#{item}: £#{price}"
    end
  end

  def add_to_basket(item, quantity)
    quantity.times { @basket << @menu.items[item] }
    @basket
  end

end
