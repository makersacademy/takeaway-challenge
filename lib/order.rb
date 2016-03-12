require_relative 'menu'

class Order

  attr_reader :basket, :price

  def initialize(menu = Menu.new)
    @basket = {}
    @menu = menu
    @price = 0
  end

  def select_item(item,quantity=1)
    @basket[item] = quantity
  end

end
