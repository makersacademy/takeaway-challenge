require './lib/menu.rb'
class Order

  attr_reader :basket
  def initialize(menu = Menu.new)
    @basket = Hash.new
    @menu = menu
  end

  def order(item_number, quantity = 1)
    @basket[item_number] = quantity
  end

  def order_total
    @basket.each do |k,v|
      @total = @menu.menu[k] * v
    end
    @total
  end
end
