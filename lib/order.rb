require './lib/menu'

class Order

  attr_reader :menu, :menu_klass, :order

  def initialize menu, menu_klass=Menu
    @menu = menu
    @menu_klass = menu_klass
    @order = []
    @total = 0
  end

  def pick_menu_item menu_item
    order << menu.read(menu_item)
  end

  def total
    order.inject(0) {|memo,item| memo + item.price}
  end

end