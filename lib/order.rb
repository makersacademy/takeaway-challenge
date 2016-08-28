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
    if basket.include?(item)
      basket[item] += 1
    else
      basket[item] = 1
    end
  end

  def remove(item)
    item.capitalize!
    fail 'Item not in basket' if basket[item].nil?
    if basket[item] == 1
      basket.delete(item)
    else
      basket[item] -= 1
    end
    @subtotal -= @menu.get_price(item)
  end

  private

  attr_reader :basket

end
