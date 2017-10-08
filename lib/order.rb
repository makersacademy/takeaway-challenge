require_relative 'menu'

class Order

  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def add(item, amount = 1)
    raise 'This is not on the menu!' unless @menu.dishes.include?(item)
    amount.times {@basket << item}
  end
end
