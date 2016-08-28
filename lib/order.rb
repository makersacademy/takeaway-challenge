require_relative 'menu'

class Order
  def initialize(menu = Menu.new)
    @basket = {}
    @subtotal = 0
    @menu = menu
  end

  def add(item)
    item.capitalize!
    @subtotal += @menu.get_price(item)
    if @basket.include?(item)
      @basket[item] += 1
    else
      @basket[item] = 1
    end
  end

end
