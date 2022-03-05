require_relative 'menu'

class Order

  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu
  end

  def add_dish(item)
    @menu.check_availability(item)
    @basket[item] += @menu.dishes[item]
  end

  def remove_dish(item)
    check_basket(item)
    @basket[item] -= @menu.dishes[item]
  end

  private

  def check_basket(item)
    msg = "Item not in the basket!"
    raise msg if @basket[item] <= 0 
  end
end
