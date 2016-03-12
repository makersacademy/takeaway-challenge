require_relative 'menu'

class Order

  NOT_ON_MENU_ERROR = 'Sorry, that item is not on the menu.'

  attr_reader :basket, :total

  def initialize(menu = Menu.new)
    @basket = {}
    @menu = menu
    @total = 0
  end

  def view_menu
    @menu.list
  end

  def select_item(item,quantity=1)
    raise NOT_ON_MENU_ERROR unless @menu.list.include? item
    @basket[item] = quantity
    @total += (@menu.price(item))*quantity
  end

end
