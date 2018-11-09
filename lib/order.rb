require_relative 'menu'

class Order

  def initialize
    @cost = 0
    @menu = Menu.new
  end

  def add(num)
    num = num.to_i - 1
    @cost += @menu.items[num][:cost]
    added_to_basket(num)
    basket
  end

  def basket
    puts "Total cost of items in basket: £#{@cost}"
  end

  private

  def added_to_basket(num)
    puts "#{@menu.items[num][:name]} added to basket"
  end

end
