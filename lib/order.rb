require_relative 'menu'

class Order

  def initialize
    @cost = 0
    @menu = Menu.new
    @basket = []
  end

  def add(num)
    index = num.to_i - 1
    @cost += @menu.items[index][:cost]
    @basket << "#{@menu.items[index][:name]} £#{@menu.items[index][:cost]}"
    added_to_basket(index)
  end

  def basket
    puts "Basket:"
    @basket.each do |item|
      puts item
    end
    puts "Total cost of items in basket:\n£#{@cost}"
  end

  private

  def added_to_basket(num)
    puts "#{@menu.items[num][:name]} added to basket"
  end

end
