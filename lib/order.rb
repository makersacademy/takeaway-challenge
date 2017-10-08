require_relative 'menu'

class Order

  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def add(item)
    raise 'This is not on the menu!' unless @menu.dishes.include?(item)
    @basket << item
  end
end
