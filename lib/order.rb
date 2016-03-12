require_relative 'menu'

class Order

  NOT_ON_MENU_ERROR = 'Sorry, that item is not on the menu.'

  attr_reader :basket, :price

  def initialize(menu = Menu.new)
    @basket = {}
    @menu = menu
    @price = 0
  end

  def select_item(item,quantity=1)
    raise NOT_ON_MENU_ERROR unless @menu.menu.include? item
    @basket[item] = quantity
  end

end
