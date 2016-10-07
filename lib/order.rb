require_relative 'menu'
require_relative 'selection'

class Order
  attr_reader :menu

  def initialize (menu = Menu.new)
    @menu = menu
  end

  def view_menu
    menu.list
  end

  def select_items
    Selection.new(menu).select
  end

end
