require_relative 'menu'

class Website

  attr_reader :item, :quantity

  def show_menu(menu = Menu.new)
    menu.list
  end

  def select(item, quantity)
    @item = item
    @quantity = quantity
  end
end
